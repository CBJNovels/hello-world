# 跨平台Hello World项目

![GitHub Actions Status](https://github.com/CBJNovels/hello-world/actions/workflows/nightly.yml/badge.svg)
![GitHub release](https://img.shields.io/github/v/release/CBJNovels/hello-world)

这是一个支持Windows/Linux的C语言示例项目，包含自动化构建和代码质量检查。

## 功能特性

- 跨平台构建（Windows/Linux）
- 每日自动构建（Nightly版本）
- 发布版本自动构建（git tag触发）
- Cppcheck静态代码分析
- 构建产物自动发布

## 使用说明

### 本地构建
```bash
make all      # 构建所有平台
make linux    # 仅构建Linux版本
make windows  # 仅构建Windows版本
make clean    # 清理构建产物
```

### 静态代码分析
每次GitHub Actions构建都会：
1. 执行全量Cppcheck检查
2. 生成XML格式报告
3. 上传为构建产物

查看分析报告：
1. 进入GitHub Actions页面
2. 选择具体构建任务
3. 在"Artifacts"部分下载报告

### 版本发布
- 每日构建：自动生成nightly版本
- 正式发布：创建v开头的tag（如v1.0.0）触发

## 项目结构
```
hello-world/
├── src/             # 源代码目录
├── bin/             # 构建输出目录
├── Makefile         # 构建配置
├── .github/         # CI/CD配置
└── README.md        # 项目文档
```

## 开发要求
- GCC (Linux)
- MinGW-w64 (Windows)
- Make 4.0+
- Cppcheck 2.7+

## 问题排查
1. Windows构建失败：检查MinGW是否安装正确
2. 权限问题：Linux可执行文件需添加执行权限
3. 分析报告为空：检查代码是否存在语法错误

## 授权协议
[MIT License](LICENSE)