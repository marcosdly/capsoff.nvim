CC = zig
ROOT_DIR = $(CURDIR)
SRC_FILE = ""
DIST_FILE = ""
CFLAG = ""

build:
ifeq ($(OS), Windows_NT)
	$(eval SRC_FILE = $(ROOT_DIR)/src/windows/capslock_off.c)
	$(eval DIST_FILE = $(ROOT_DIR)/dist/capslock_off.exe)
	@if not exist $(ROOT_DIR)/dist mkdir dist
	$(CC) $(SRC_FILE) -o $(DIST_FILE)
else
	$(eval SRC_FILE = $(ROOT_DIR)/src/linux/capslock_off.c)
	$(eval DIST_FILE = $(ROOT_DIR)/dist/capslock_off)
	$(eval CFLAG = -lX11 -lXtst)
	@mkdir -p ./dist
	$(CC) $(SRC_FILE) -o $(DIST_FILE) $(CFLAG)
endif

