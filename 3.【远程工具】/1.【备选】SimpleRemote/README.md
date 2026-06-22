# SimpleRemote

本目录包含 `SimpleRemote.exe`，用于管理和启动常见远程连接。

## 上游来源

- GitHub 仓库：https://github.com/beckzhu/SimpleRemote
- 上游 README：https://raw.githubusercontent.com/beckzhu/SimpleRemote/master/README.md
- 上游主页：http://www.91fk.net/
- 本地版本：`1.3.1.0`

## 工具状态

上游 README 开头标注项目已停止维护。本目录中的程序可作为备选远程管理工具使用，但不建议作为长期更新方案。

## 工具简介

`SimpleRemote` 是一个远程管理工具，支持以选项卡或独立窗口方式管理远程连接。上游 README 描述其支持 RDP、SSH、Telnet 协议。

## 主要功能

- 支持 RDP、SSH、Telnet 连接。
- 支持选项卡式界面，也支持独立窗口模式。
- 程序体积较小，上游 README 提到压缩包约 3 MB。
- 无广告。
- 使用 MahApps.Metro 风格界面。
- 可为 SSH、Telnet 设置配色。
- 使用 ActiveX 和 PuTTY 相关能力实现连接。
- 可保存远程连接信息，并支持自定义密码加密。

## 使用建议

1. 运行 `SimpleRemote.exe`。
2. 在远程列表中新增连接，按协议填写主机、端口、账号等信息。
3. 对 SSH/Telnet 连接可按需要调整配色。
4. 如需保存敏感连接信息，建议启用自定义密码加密，并妥善保存密码。

## 注意事项

- 该项目已停止维护，遇到兼容性或安全问题时建议优先改用仍在维护的工具。
- 上游 README 本身为中文，但原文件编码/显示存在兼容性问题；本文件为重新整理后的 UTF-8 中文版。
