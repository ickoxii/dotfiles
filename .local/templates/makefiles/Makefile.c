#!/usr/bin/make -f

# file: Makefile
# author: Icko Iben
# course: CSI 3336
# due date: 10/04/2024
#
# date modified:        10/04/2024
#   - valgrind target added
#   - use gnu89 as standard
#
# date modified:        10/03/2024
#   - file created (and finished)
#
# Description

VERSION = 0.1.0

# Search paths
vpath %.c src
vpath %.h include

# Compilation options
CFLAGS = -Wall -Werror -Wextra -Wpedantic -std=gnu89 -g
INCLUDES = -I include
CC = gcc
PROGRAM = #***** PROGRAM NAME *****#
OUTPUT_OPTION = -o $@

# Directories
BUILD_DIR = build

# Files
SOURCES = #***** LIST .c FILES HERE *****#
HEADERS = #***** LIST .h FILES HERE *****#
OBJECTS = $(addprefix $(BUILD_DIR)/, $(SOURCES:.c=.o))

# Targets
all: build
.PHONY: all

.PHONY: help
help: ## Help function
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: $(PROGRAM)
	@echo "========"
	@echo "Project built"
	@echo "Run ./$(PROGRAM) to run the program"
.PHONY: build

$(PROGRAM): $(OBJECTS)
	$(CC) $(OBJECTS) $(OUTPUT_OPTION)

# Why does this target work but $(OBJECTS): $(SOURCES) or $(OBJECTS): %.c not
# work?
# $(OBJECTS): $(SOURCES)
# $(OBJECTS): %.c
$(BUILD_DIR)/%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< $(OUTPUT_OPTION)

valgrind: $(PROGRAM)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./$(PROGRAM)
.PHONY: valgrind

clean-objects:
	rm -f $(OBJECTS)
.PHONY: clean-objects

clean: clean-objects
	rm -f $(PROGRAM)
.PHONY: clean
