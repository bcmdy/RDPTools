# rdpWrapper

本目录包含 `rdpWrapper_x64.exe`，用于安装、配置和维护 RDP Wrapper。

## 上游来源

- GitHub 仓库：https://github.com/sergiye/rdpWrapper
- 上游 README：https://raw.githubusercontent.com/sergiye/rdpWrapper/master/README.md
- 本地文件版本：`2.15.9659.21489`
- 作者信息：SergiyE / Sergiy Egoshyn

## 工具简介

`rdpWrapper` 是一个 RDP Wrapper 安装与配置工具。它的设计思路来自 Stas'M 的 `rdpwrap` 项目，但使用 .NET 编写，并尽量做成小型、便携的单文件应用。

RDP Wrapper 的核心机制是在 Service Control Manager 和 Terminal Services 之间工作，不直接修改原始 `termsrv.dll`。这种方式通常比直接补丁 `termsrv.dll` 更容易应对 Windows Update。

## 主要功能

- 安装、卸载和配置 RDP Wrapper。
- 查看 RDP 服务当前状态。
- 在部分 Windows 家庭版/简化版系统上启用远程桌面主机能力。
- 支持控制台会话和远程会话同时存在。
- 可配置同一用户本地与远程同时登录。
- 对未被现有配置支持的新系统版本，可尝试自动生成偏移配置。
- 可检查程序更新。
- 配合 TermWrap 时可启用摄像头、USB 重定向等能力。

## 使用建议

1. 右键以管理员身份运行 `rdpWrapper_x64.exe`。
2. 优先确认系统中的 `termsrv.dll` 是原版文件。若之前被其他补丁工具修改过，建议先恢复原版，否则可能不稳定。
3. 若系统版本较新且现有配置不支持，可使用工具生成或更新配置。
4. 自动生成偏移配置时，上游 README 提到需要安装 Microsoft Visual C++ Redistributable。

## 注意事项

- 修改远程桌面相关服务前，建议先创建系统还原点或备份关键文件。
- 安全软件可能会拦截此类系统级工具，使用前请确认文件来源可信。
- 本说明为上游 README 的中文整理版，并结合本仓库内文件用途补充。
