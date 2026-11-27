# SuperRDP2

本目录包含 `SuperRDP2.exe`、`SuperRDP.dll`、`superrdp.ini`，以及上游说明 `readme.txt` 和配置来源说明 `ini文件更新.txt`。

## 上游来源

- 作者：汉客儿 / anhkgg
- 官网：https://www.hankeer.org
- GitHub 仓库：https://github.com/anhkgg/SuperRDP
- 中文帮助：https://github.com/anhkgg/SuperRDP/blob/main/superrdp2_help_cn.md
- 本地版本：`2.1.0.1`

## 版本状态

- `SuperRDP2.exe` 与 `SuperRDP.dll` 均为 `2.1.0.1`，与上游最新 release `v2.1.0.1`（2023-02-28）一致，没有更新的正式版本。
- 上游曾预告 2.2，但截至 2026-11-27 仍未发布；issues 中仍有 10.0.26200 / 26300 等新系统不受支持的反馈。
- 因此该工具能否使用，主要取决于 `superrdp.ini` 是否覆盖当前系统版本，而不是程序版本。

## 关于 superrdp.ini

- 本目录的 `superrdp.ini` 已替换为 sebaxakerhtc 维护的配置（文件头为 `; Edited by sebaxakerhtc`，`Updated=2026-11-16`），共 773 个系统版本段，最高覆盖到 `10.0.29639.1000`。
- 来源与 `ini文件更新.txt` 中的地址同源：

  ```text
  https://raw.githubusercontent.com/sebaxakerhtc/rdpwrap.ini/master/rdpwrap.ini
  ```

- 更新方式：从上面的地址下载后覆盖本目录 `superrdp.ini`，再在 SuperRDP 中重新应用补丁。

## 与备用注册表的关系

SuperRDP 会把 `TermService` 的 `ServiceDll` 指向 `C:\WINDOWS\system32\superrdp.dll`。`5.【备用注册表】/termsrv服务 注册表win11.reg` 保存的正是这个状态；要恢复原版请改用 `termsrv服务 注册表win10.reg`。

## 注意事项

- 操作前建议创建系统还原点，并确认 `termsrv.dll` 为原版文件，避免与 RDP Wrapper 等其它方案叠加修改。
- 安全软件可能拦截 `SuperRDP.dll`，使用前请确认文件来源可信。
