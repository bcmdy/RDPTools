@ECHO OFF
CD /D %~DP0
TITLE auther:lrwy
mode con cols=62 lines=33
@echo.

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

@echo off
setlocal

REM 关闭命令运行完成的回显
echo off

set /p username=请输入用户名: 

REM 输入用户密码
set /p password=请输入用户密码: 

REM 将用户的密码设置为永不过期
net user %username% %password% /expires:never

REM 检查密码是否成功设置为永不过期
if %errorlevel% equ 0 (
    echo 用户 %username% 的密码已设置为永不过期
) else (
    echo 密码设置失败，请重试
)

:end
pause
endlocal
