# 跨平台构建配置文件
# 支持Linux/Win环境，包含增强错误处理

# 编译器定义
CC_WIN := x86_64-w64-mingw32-gcc  # Windows交叉编译器
CC_LINUX := gcc                   # Linux本地编译器

# 构建目标定义
TARGET_WIN := hello-world.exe      # Windows可执行文件
TARGET_LINUX := hello-world        # Linux可执行文件

# 默认构建目标
.DEFAULT_GOAL := all
.PHONY: all linux windows clean

all: linux windows

# Linux构建任务
linux:
	@echo "[INFO] 开始构建Linux版本..."
	@$(CC_LINUX) src/main.c -o $(TARGET_LINUX) \
		|| (echo "[ERROR] Linux构建失败"; exit 1)
	@echo "[SUCCESS] Linux构建完成: $(TARGET_LINUX)"

# Windows构建任务
windows:
	@echo "[INFO] 开始构建Windows版本..."
	@$(CC_WIN) src/main.c -o $(TARGET_WIN) \
		|| (echo "[ERROR] Windows构建失败"; exit 1)
	@echo "[SUCCESS] Windows构建完成: $(TARGET_WIN)"

# 清理构建产物（跨平台兼容）
clean:
ifeq ($(OS),Windows_NT)
	@if exist $(TARGET_WIN) ( \
		echo "清理Windows可执行文件..." && \
		del $(TARGET_WIN) || (echo "[ERROR] 清理失败" && exit 1) \
	)
	@if exist $(TARGET_LINUX) ( \
		echo "清理Linux可执行文件..." && \
		rm -rf $(TARGET_LINUX) || (echo "[ERROR] 清理失败" && exit 1) \
	)
else
	@rm -f $(TARGET_LINUX) $(TARGET_WIN) || (echo "[ERROR] 清理失败" && exit 1)
endif
	@echo "[SUCCESS] 清理完成"