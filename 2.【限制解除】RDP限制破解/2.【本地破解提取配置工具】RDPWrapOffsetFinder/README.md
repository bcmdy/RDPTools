# RDPWrapOffsetFinder

本目录包含 `RDPWrapOffsetFinder` 的 32 位和 64 位版本，用于从 `termsrv.dll` 中查找 RDP Wrapper 所需偏移并生成 `rdpwrap.ini` 配置片段。

## 上游来源

- GitHub 仓库：https://github.com/llccd/RDPWrapOffsetFinder
- 上游 README：https://raw.githubusercontent.com/llccd/RDPWrapOffsetFinder/master/README.md
- 本地版本：`v1.0`

## 工具简介

`RDPWrapOffsetFinder` 会分析 `termsrv.dll`，自动查找 RDPWrap 需要的偏移值，并生成可用于 `rdpwrap.ini` 的配置。

## 目录说明

- `32bit/`：32 位版本工具及依赖。
- `64bit/`：64 位版本工具及依赖。
- `RDPWrapOffsetFinder.exe`：优先使用符号文件查找偏移。
- `RDPWrapOffsetFinder_nosymbol.exe`：不依赖符号文件，改用特征搜索方式查找偏移。

## 使用方法

```powershell
RDPWrapOffsetFinder.exe C:\Windows\System32\termsrv.dll
```

如果不传入 `termsrv.dll` 路径，工具默认使用当前系统 `System32` 目录中的 `termsrv.dll`。

## 注意事项

- 普通版本需要 `termsrv.dll` 对应的 PDB 符号文件。如果输出 `Symbol not found`，请检查是否能访问 Microsoft Symbol Server。
- 可通过 `_NT_SYMBOL_PATH` 环境变量配置符号服务器或符号代理。
- 如果无法取得符号文件，可以尝试 `_nosymbol` 版本。
- 上游 README 特别说明：32 位 `_nosymbol` 版本测试不充分，可能返回错误结果。
- 本目录已随工具放置 `Zydis.dll`、`dbghelp.dll`、`symsrv.dll` 等依赖文件。

## 编译说明

上游项目依赖 Zydis。自行编译时，需要先初始化子模块并构建 Zydis DLL，再构建 `RDPWrapOffsetFinder.sln`，最后将 `dbghelp.dll`、`symsrv.dll`、`symsrv.yes`、`Zydis.dll` 等文件放到 EXE 同目录。

本说明为上游 README 的中文翻译整理版。
