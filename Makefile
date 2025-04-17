# 定义编译器和编译选项
CC = gcc
CFLAGS = -Wall -O2

# 定义目标文件名称（根据操作系统附加后缀）
TARGET = hello_world

ifeq ($(OS),Windows_NT)
    EXT = .exe
else
    EXT =
endif

# 默认目标规则
all: $(TARGET)$(EXT)

# 构建目标
$(TARGET)$(EXT): src/hello_world.c
	$(CC) $(CFLAGS) -o $@ src/hello_world.c

# 清理构建
clean:
	rm -f $(TARGET)$(EXT)

# 注释说明：
# 1. 自动检测操作系统，生成适合的平台构建产物。
# 2. 默认目标是 `all`，运行 `make` 即可构建。
# 3. 使用 `make clean` 清理生成的文件。