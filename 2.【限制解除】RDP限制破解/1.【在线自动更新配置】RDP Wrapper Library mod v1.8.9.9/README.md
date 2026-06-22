# RDP Wrapper Library mod v1.8.9.9

本目录包含 `RDPW_Installer.exe` 和 `RDPW_Uninstaller.exe`，用于安装或卸载 sebaxakerhtc 修改版 RDP Wrapper。

## 上游来源

- GitHub 仓库：https://github.com/sebaxakerhtc/rdpwrap
- 上游 README：https://raw.githubusercontent.com/sebaxakerhtc/rdpwrap/master/README.md
- 配置文件来源：https://github.com/sebaxakerhtc/rdpwrap.ini
- 原始项目：https://github.com/stascorp/rdpwrap
- 本地版本：`1.8.9.9`

## 工具简介

这是基于 Stas'M `RDP Wrapper Library` 的修改版。RDP Wrapper 的目标是在不直接修改 `termsrv.dll` 的情况下，启用远程桌面主机和并发 RDP 会话能力。

该修改版提供安装器和卸载器，并可配合在线更新的 `rdpwrap.ini` 配置使用。

## 上游 README 要点

- x86 Delphi 版本可使用 Embarcadero RAD Studio 11 构建。
- H264 优先级可通过 LGPO 及项目中的 `H264_ON` / `H264_OFF` 文件手动开关。
- 安装器和卸载器由 Bat to Exe Converter 打包生成。
- 安装时上游建议临时关闭安全软件，安装后将 `C:\Program Files\RDP Wrapper` 加入排除项，再重新启用安全软件。

## 使用建议

1. 以管理员身份运行 `RDPW_Installer.exe` 安装。
2. 如需卸载，以管理员身份运行 `RDPW_Uninstaller.exe`。
3. 若系统版本更新后失效，参考上级目录中的 `ini文件更新.txt`，从 `sebaxakerhtc/rdpwrap.ini` 更新配置文件。

## 注意事项

- 远程桌面服务属于系统核心组件，操作前建议创建还原点。
- 安全软件可能会拦截安装器或相关 DLL，使用前请确认来源可信。
- 本说明为上游 README 的中文整理版，并结合本仓库内文件用途补充。
