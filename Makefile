# 跨平台构建配置文件

# 编译器定义
CC_WIN = x86_64-w64-mingw32-gcc  # Windows交叉编译器
CC_LINUX = gcc                   # Linux本地编译器

# 构建目标定义
TARGET_WIN = bin/hello-world.exe # Windows可执行文件路径
TARGET_LINUX = bin/hello-world   # Linux可执行文件路径

# 默认构建目标
all: prepare linux windows

# 创建构建目录
prepare:
	mkdir -p bin

# Linux构建任务
linux:
	@echo "[INFO] 开始构建Linux版本..."
	$(CC_LINUX) src/main.c -o $(TARGET_LINUX)
	@echo "[SUCCESS] Linux构建完成: $(TARGET_LINUX)"

# Windows构建任务
windows:
	@echo "[INFO] 开始构建Windows版本..."
	$(CC_WIN) src/main.c -o $(TARGET_WIN)
	@echo "[SUCCESS] Windows构建完成: $(TARGET_WIN)"

# 清理构建产物
clean:
	rm -rf bin