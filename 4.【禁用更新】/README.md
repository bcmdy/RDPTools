# Windows Update Blocker

本目录包含 `Wub.exe`（32 位）、`Wub_x64.exe`（64 位）、`Wub.ini` 和上游说明 `ReadMe.txt`，用于一键禁用或恢复 Windows 自动更新。

## 上游来源

- 官网页面：https://www.sordum.org/9470/windows-update-blocker-v1-8/
- 作者：Sordum.org（BlueLife / velociraptor）
- 本地版本：`1.8.0.0`（v1.8，2023-06-09 发布）
- 上游状态：截至 2026-11-27，官网当前版本仍为 v1.8，本地文件即官方最新版

## 文件校验

官网公布了两个 EXE 的校验值，与本地文件一致，可据此确认文件未被改动：

| 文件 | MD5 |
| --- | --- |
| `Wub_x64.exe` | `9d6778f7f274f7ecd4e7e875a7268b64` |
| `Wub.exe` | `82aff8883099cf75462057c4e47e88ac` |

## 使用建议

1. 以管理员身份运行 `Wub_x64.exe`（64 位系统）或 `Wub.exe`（32 位系统）。
2. 选择 `Disable Service`，勾选 `Protect service settings`，点击 `Apply Now` 禁用更新。
3. 需要恢复更新时改选 `Enable Service`，再点 `Apply Now`。
4. `Wub.ini` 保存界面语言、上次选项和需要一起处理的服务列表，可按上游说明在 `[Service_List]` 段补充服务名。

## 注意事项

- 本工具不修改 `termsrv.dll`，但会让系统长期停留在当前版本，远程桌面相关的系统补丁也不会再安装。
- 该工具不拦截 Microsoft Defender 的病毒库更新。
- 教程主流程并未强制要求禁用更新；只有希望锁定当前 `termsrv.dll` 版本、避免 RDP 配置被系统更新打乱时，才建议临时使用。
