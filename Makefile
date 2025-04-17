# 跨平台构建配置文件
# 支持Linux/Win环境，包含增强错误处理

# 编译器定义
CC_WIN := x86_64-w64-mingw32-gcc  # Windows交叉编译器
CC_LINUX := gcc                   # Linux本地编译器

# 构建目标定义
TARGET_WIN := bin/hello-world.exe # Windows可执行文件路径
TARGET_LINUX := bin/hello-world   # Linux可执行文件路径

# 默认构建目标
.DEFAULT_GOAL := all
.PHONY: all prepare linux windows clean

all: prepare linux windows

# 创建构建目录（跨平台兼容）
prepare:
	@echo "[INFO] 准备构建目录..."
ifeq ($(OS),Windows_NT)
	@if not exist bin ( \
		echo "创建 bin 目录..." && \
		mkdir bin || (echo "[ERROR] 无法创建目录 bin" && exit 1) \
	)
else
	@mkdir -p bin || (echo "[ERROR] 无法创建目录 bin" && exit 1)
endif
	@echo "[SUCCESS] 目录准备完成"

# Linux构建任务
linux: prepare
	@echo "[INFO] 开始构建Linux版本..."
	@$(CC_LINUX) src/main.c -o $(TARGET_LINUX) \
		|| (echo "[ERROR] Linux构建失败"; exit 1)
	@echo "[SUCCESS] Linux构建完成: $(TARGET_LINUX)"

# Windows构建任务
windows: prepare
	@echo "[INFO] 开始构建Windows版本..."
	@$(CC_WIN) src/main.c -o $(TARGET_WIN) \
		|| (echo "[ERROR] Windows构建失败"; exit 1)
	@echo "[SUCCESS] Windows构建完成: $(TARGET_WIN)"

# 清理构建产物（跨平台兼容）
clean:
ifeq ($(OS),Windows_NT)
	@if exist bin ( \
		echo "清理构建产物..." && \
		rmdir /s /q bin || (echo "[ERROR] 清理失败" && exit 1) \
	)
else
	@rm -rf bin || (echo "[ERROR] 清理失败" && exit 1)
endif
	@echo "[SUCCESS] 清理完成"