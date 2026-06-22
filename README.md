# RDPTools

RDPTools 是一个面向 Windows 远程桌面使用场景的工具与资料集合，主要用于整理远程桌面教程、RDP 限制解除工具、远程连接客户端、常用脚本、禁用更新工具和备用注册表文件。

本项目更像是一个“工具箱”而不是单一程序：不同目录对应不同使用场景，使用前请先阅读对应目录中的 README 或说明文件。

## 目录说明

| 目录 | 内容 | 适用场景 |
| --- | --- | --- |
| `0.【一些教程】` | PDF 教程、故障截图和补充说明 | 了解远程桌面多用户、后台挂机、常见错误处理 |
| `1.【命令工具】bat脚本` | 常用批处理脚本 | 处理远程桌面连接、断开连接、用户密码相关操作 |
| `2.【限制解除】RDP限制破解` | RDP Wrapper、SuperRDP、偏移提取工具等 | 解除 Windows 远程桌面主机和多会话限制 |
| `3.【远程工具】` | 1Remote、SimpleRemote | 管理和启动 RDP/SSH/Telnet/VNC 等远程连接 |
| `4.【禁用更新】` | Windows Update Blocker | 临时禁用 Windows 更新，降低远程桌面配置被系统更新破坏的概率 |
| `5.【备用注册表】` | termsrv 服务相关注册表备份 | 需要回滚或修复远程桌面服务注册表时参考 |

## 推荐使用顺序

1. 先阅读 `0.【一些教程】` 中的教程，确认自己的目标是远程控制、后台挂机，还是多用户并发远程桌面。
2. 如果只是管理远程连接，优先使用 `3.【远程工具】/0.【推荐】1Remote`。
3. 如果需要解除 Windows 远程桌面限制，优先查看 `2.【限制解除】RDP限制破解/0.【推荐无配置通杀工具】rdpWrapper`。
4. 如果 `rdpWrapper` 对当前系统版本不适配，再考虑 `RDP Wrapper Library mod`、`SuperRDP2` 或 `RDPWrapOffsetFinder`。
5. 修改系统服务、注册表或 RDP 配置前，建议先创建系统还原点。

## 重点工具

### 1Remote

路径：`3.【远程工具】/0.【推荐】1Remote`

现代化远程连接管理器，支持 RDP、SSH、VNC、Telnet、SFTP/FTP、RemoteApp 等协议。适合作为日常远程连接入口。

### rdpWrapper

路径：`2.【限制解除】RDP限制破解/0.【推荐无配置通杀工具】rdpWrapper`

RDP Wrapper 安装与配置工具。它通过包装 Terminal Services 的方式工作，通常不直接修改 `termsrv.dll`。

### RDP Wrapper Library mod

路径：`2.【限制解除】RDP限制破解/1.【在线自动更新配置】RDP Wrapper Library mod v1.8.9.9`

基于 Stas'M RDP Wrapper 的修改版，包含安装器和卸载器，可配合在线 `rdpwrap.ini` 配置使用。

### RDPWrapOffsetFinder

路径：`2.【限制解除】RDP限制破解/2.【本地破解提取配置工具】RDPWrapOffsetFinder`

用于分析 `termsrv.dll` 并提取 RDP Wrapper 所需偏移，适合在系统更新后现有配置暂不支持时使用。

### SuperRDP2

路径：`2.【限制解除】RDP限制破解/3.【需手动下载替换更新配置】SuperRDP2`

另一套远程桌面限制解除工具。目录内已有 `readme.txt` 和 `ini文件更新.txt`。

## 更新 rdpwrap.ini

如果 RDP Wrapper 因 Windows 更新失效，可参考以下配置源更新 `rdpwrap.ini`：

```text
https://raw.githubusercontent.com/sebaxakerhtc/rdpwrap.ini/master/rdpwrap.ini
```

相关说明文件位于：

- `2.【限制解除】RDP限制破解/ini文件更新.txt`
- `2.【限制解除】RDP限制破解/3.【需手动下载替换更新配置】SuperRDP2/ini文件更新.txt`

## 安全提醒

- 本仓库包含会修改系统远程桌面行为的工具，请只在自己拥有管理权限的设备上使用。
- 运行 EXE、BAT、REG 文件前，请确认来源可信，并理解其作用。
- 建议在虚拟机或备用机器上先测试，再用于重要环境。
- 修改 `termsrv.dll`、远程桌面服务或注册表前，请备份系统或创建还原点。
- 安全软件可能会拦截远程桌面破解/包装类工具，这类提示需要结合文件来源自行判断。

## 上游来源与许可证

本仓库收集了多个第三方工具。各工具的上游仓库、作者信息和说明已尽量补充在对应目录的 README 中。使用、分发或二次修改时，请遵守对应项目的许可证和原作者说明。

