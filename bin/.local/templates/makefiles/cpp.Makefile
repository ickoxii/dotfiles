#!/usr/bin/make -f

VERSION = 0.1.0

# Search paths
vpath %.cpp src
vpath %.hpp include
vpath %.o build

# Compilation options
CFLAGS := -Wall -Werror -Wextra -Wpedantic -std=c++20 -stdlib=libc++
INCLUDES := -I include
CC := clang++
PROGRAM := #***** PROGRAM NAME *****#
OUTPUT_OPTION = -o $@

# Directories
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
BIN_DIR = bin

# Files
SOURCES = $(wildcard $(SRC_DIR)/*.c)
HEADERS = $(wildcard $(INCLUDE_DIR)/*.h)
OBJECTS = $(subst src,build,$(subst .c,.o,$(SOURCES)))

# Targets
all: build
.PHONY: all

info:
	$(info SOURCES=$(SOURCES))
	$(info HEADERS=$(HEADERS))
	$(info OBJECTS=$(OBJECTS))
	$(info PROGRAM=$(PROGRAM))
.PHONY: info

help: ## Help function
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

debug: CFLAGS += -g -DDEBUG
debug: $(PROGRAM)
.PHONY: debug

build: $(PROGRAM)
	@echo "========"
	@echo "Project built"
	@echo "Run ./$(PROGRAM) to run the program"
.PHONY: build

$(PROGRAM): $(OBJECTS)
	$(CC) $(OBJECTS) $(OUTPUT_OPTION)

$(BUILD_DIR)/%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< $(OUTPUT_OPTION)

valgrind: $(PROGRAM)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./$(PROGRAM)
.PHONY: valgrind

clean-objects:
	rm -f $(OBJECTS)
.PHONY: clean-objects

clean: ## Clean all generated files
clean: clean-objects
	rm -f $(PROGRAM)
.PHONY: clean
