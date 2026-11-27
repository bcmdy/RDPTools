# 备用注册表

本目录存放两个 `TermService` 服务的注册表备份，用于回滚或修复远程桌面服务配置。**两个文件的内容并不等价，导入前请先确认场景。**

## 文件说明

| 文件 | `ServiceDll` 指向 | 适用场景 |
| --- | --- | --- |
| `termsrv服务 注册表win10.reg` | `%SystemRoot%\System32\termsrv.dll` | 原版系统路径，用于把被改过的 `TermService` 恢复成系统默认 |
| `termsrv服务 注册表win11.reg` | `C:\WINDOWS\system32\superrdp.dll` | SuperRDP 接管后的路径，仅在已安装 `SuperRDP.dll` 时使用 |

`win10` / `win11` 只表示导出时所用的系统，不是版本限制；真正的差别是 `ServiceDll` 指向哪个 DLL。

## 使用前必读

- `termsrv服务 注册表win11.reg` 会把远程桌面服务加载的 DLL 改成 `C:\WINDOWS\system32\superrdp.dll`。如果系统里没有这个文件、或者 SuperRDP 已被卸载，导入后 `TermService` 将无法启动，远程桌面会直接不可用。
- 想要恢复原版、清掉 SuperRDP 痕迹时，应导入 `termsrv服务 注册表win10.reg`，或手工把 `ServiceDll` 改回 `%SystemRoot%\System32\termsrv.dll`。
- 导入前先导出当前状态做备份：

  ```text
  reg export "HKLM\SYSTEM\CurrentControlSet\Services\TermService" TermsService_backup.reg /y
  ```

- 导入后重启服务使其生效：

  ```text
  net stop TermService && net start TermService
  ```

## 注意事项

- 这两个文件只备份 `TermService` 服务的键值，不含远程桌面的策略、端口、用户组等其它设置。
- 文件为 UTF-16LE 编码（注册表编辑器默认导出格式），请勿另存为 UTF-8，否则 `regedit` 会提示格式无效。
