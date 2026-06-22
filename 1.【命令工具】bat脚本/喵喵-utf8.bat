@ECHO OFF                    
CD /D %~DP0                  
TITLE  auther:lrwy                      
mode con cols=62 lines=33    
@ echo.                      
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (    
REM 使用 REG 命令查询注册表项
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"    
REM 创建一个 VBS 脚本文件来获取管理员权限
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"    
REM 在 VBS 脚本中执行批处理文件以获取管理员权限
    "%TEMP%\Getadmin.vbs"    
REM 运行 VBS 脚本以获取管理员权限
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL    
REM 删除临时的 VBS 脚本文件
    Exit /b    
REM 退出当前批处理文件
)


@ echo.
@ echo.功能选择：
:Menu
echo.&echo  1. 新增远程桌面用户并添加到对应组
echo.&echo  2. 远程桌面端口开关
echo.&echo  3. Windows家庭版添加组策略功能
echo.&echo  4. 打开组策略编辑器
echo.&echo  5. sfc系统修复命令
echo.&echo  6. 显隐用户
echo.&echo  7. 删除用户和用户文件(危险操作)

echo.&echo.
set /p a=输入数字后回车：
IF NOT "%a%"=="" SET a=%a:~0,1%
if "%a%"=="1" set a=<nul&&CLS && Goto R1
if "%a%"=="2" set a=<nul&&CLS && Goto R2
if "%a%"=="3" set a=<nul&&CLS && Goto R3
if "%a%"=="4" set a=<nul&&CLS && Goto R4
if "%a%"=="5" set a=<nul&&CLS && Goto R5
if "%a%"=="6" set a=<nul&&CLS && Goto R6
if "%a%"=="7" set a=<nul&&CLS && Goto R7
echo.&echo 输入无效，请重新输入！ 
PAUSE >NUL && CLS && GOTO Menu

:R1

@echo off
setlocal

REM 关闭命令运行完成的回显
echo off

set /p username=请输入新用户名: 
set /p password=请输入新用户密码: 

REM 创建新用户
net user %username% %password% /add /expires:never

REM 检查用户是否创建成功
if %errorlevel% equ 0 (
    echo 用户 %username% 创建成功。
) else (
    echo 用户 %username% 创建失败。
    goto :end
)

REM 将新用户添加到管理员组
net localgroup administrators %username% /add

REM 检查用户是否成功添加到管理员组
net localgroup administrators | findstr /i "\<%username%\>"
if %errorlevel% equ 0 (
    echo 用户 %username% 已成功添加到管理员组。
) else (
    echo 用户 %username% 添加到管理员组失败。
)

REM 将新用户添加到远程桌面组
net localgroup "Remote Desktop Users" %username% /add

REM 检查用户是否成功添加到远程桌面组
net localgroup "Remote Desktop Users" | findstr /i "\<%username%\>"
if %errorlevel% equ 0 (
    echo 用户 %username% 已成功添加到远程桌面组。
) else (
    echo 用户 %username% 添加到远程桌面组失败。
)

set /p hideUser=是否隐藏新用户？(y/n): 

IF /I "%hideUser%"=="y" (
    REM 隐藏新用户
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v %username% /t REG_DWORD /d 0 /f

    REM 检查用户是否成功隐藏
    reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v %username%
    if %errorlevel% equ 0 (
        echo 用户 %username% 已成功隐藏。
    ) else (
        echo 用户 %username% 隐藏失败。
    )
) else (
    echo 用户 %username% 未隐藏。
)

:end

pause
endlocal

echo.&echo 返回主菜单
GOTO MENU


:R2
@echo off
setlocal

echo ===============================
echo 远程桌面端口设置
echo ===============================
echo 1. 开启 3389 端口
echo 2. 关闭 3389 端口
echo ===============================

set /p choice=请输入选项（1或2）: 

if "%choice%"=="1" (
    REM 开启 3389 端口
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d 0 /f
    echo 3389 端口已开启
) else if "%choice%"=="2" (
    REM 关闭 3389 端口
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d 1 /f
    echo 3389 端口已关闭
) else (
    echo 无效的选项，请重新运行脚本并输入有效选项（1或2）。
    goto end
)

REM 停止远程桌面服务
net stop TermService

REM 重启远程桌面服务
net start TermService

echo 等待检测端口状态...
timeout /t 5 >nul

REM 检测端口状态
netstat -an | findstr /c:"0.0.0.0:3389" >nul
if %errorlevel%==0 (
    echo 远程桌面端口已成功开启
) else (
    echo 远程桌面端口未能成功开启
)

netstat -an | findstr /c:"0.0.0.0:3389" >nul
if %errorlevel%==1 (
    echo 远程桌面端口已成功关闭
) else (
    echo 远程桌面端口未能成功关闭
)

:end
pause




CLS && ECHO.&ECHO 任意键返回！&&PAUSE >NUL && CLS && GOTO MENU

:R3
@echo off
pushd "%~dp0"
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"
CLS && ECHO.&ECHO 添加组策略完成，任意键返回！&&PAUSE >NUL && CLS && GOTO MENU

:R4
gpedit.msc
CLS && ECHO.&ECHO 任意键返回！&&PAUSE >NUL && CLS && GOTO MENU

:R5
sfc/scannow
CLS && ECHO.&ECHO 任意键返回！&&PAUSE >NUL && CLS && GOTO MENU



:R6
@echo off
setlocal

REM 关闭命令运行完成的回显
echo off

REM 列出所有用户账户
net user

set /p username=请输入要显示或隐藏的用户名: 

REM 检查用户是否存在
net user %username% | findstr /i "\<%username%\>"
if %errorlevel% neq 0 (
    echo 用户 %username% 不存在。
    goto :end
)

REM 显示/隐藏用户的选项
:choose
echo.
echo 请选择要执行的操作：
echo 1. 显示用户
echo 2. 隐藏用户
set /p option=请输入选项的编号： 

IF "%option%"=="1" (
    REM 显示用户
    reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v %username% /f
    echo 用户 %username% 已显示。
) else IF "%option%"=="2" (
    REM 隐藏用户
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v %username% /t REG_DWORD /d 0 /f
    echo 用户 %username% 已隐藏。
) else (
    echo 无效的选项，请重新选择。
    goto :choose
)

:end


CLS && ECHO.&ECHO 任意键返回！&&PAUSE >NUL && CLS && GOTO MENU

:R7

@echo off
setlocal

REM 关闭命令运行完成的回显
echo off

REM 列出所有用户账户
net user

REM 警告不要删除不认识的账户
echo.
echo 警告：请确保您只删除您知道的、无用的用户账户。
echo 警告：删除错误的用户账户可能导致数据丢失或系统不稳定。
echo.

set /p username=请输入要删除的用户名: 

REM 检查用户是否存在
net user %username% | findstr /i "\<%username%\>"
if %errorlevel% neq 0 (
    echo 用户 %username% 不存在。
    goto :end
)

REM 警告危险操作
echo.
echo 警告：删除用户 %username% 的操作是不可逆的！
echo 警告：这将永久删除该用户的所有文件和设置。
echo.
set /p confirm=是否确定要删除用户 %username%？(y/n): 

IF /I "%confirm%"=="y" (
    REM 删除用户账户
    net user %username% /delete

    REM 检查是否成功删除用户账户
    net user %username% | findstr /i "\<%username%\>"
    if %errorlevel% neq 0 (
        echo 用户 %username% 删除失败。
    ) else (
        echo 用户 %username% 删除成功。
    )
) else (
    echo 用户 %username% 未删除。
)

:end

CLS && ECHO.&ECHO 任意键返回！&&PAUSE >NUL && CLS && GOTO MENU

