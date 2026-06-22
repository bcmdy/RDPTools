@ECHO OFF
CD /D %~DP0
TITLE 设置密码永不过期
mode con cols=62 lines=20

>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

@echo off
setlocal

set /p username=请输入用户名: 

echo.
echo 正在检查用户 [%username%] 的当前状态...

REM 先查看当前状态
net user %username% 2>nul | findstr /i "密码到期"
if %errorlevel% neq 0 (
    echo [错误] 用户 %username% 不存在或无法查询！
    goto end
)

echo.
echo 正在设置密码永不过期...

REM 使用 PowerShell 设置密码永不过期（替代已弃用的 wmic）
powershell -NoProfile -Command "Set-LocalUser -Name '%username%' -PasswordNeverExpires $true" 2>nul

if %errorlevel% equ 0 (
    echo [成功] 用户 %username% 的密码已设置为永不过期
    echo.
    echo 验证结果：
    net user %username% | findstr /i "密码到期"
) else (
    echo [失败] 设置失败，请检查用户名是否正确或PowerShell是否可用
)

:end
echo.
pause
endlocal