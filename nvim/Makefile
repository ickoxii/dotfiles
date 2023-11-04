# File: Makefile
# Author: Icko Iben
# Creates symlinks from ~/.dotfiles/nvim to ~/.config/nvim

# Replace ~/.config/nvim with the target directory where you want the symlinks.
TARGET_DIR = ~/.config/nvim

# The source directory containing your nvim config files.
SOURCE_DIR = ~/.dotfiles/nvim

# List of file extensions to include in the symlinking process.
FILE_EXTENSIONS = lua md

# The find command to locate files with specified extensions.
FIND_COMMAND = find $(SOURCE_DIR) -type f \( $(foreach ext,$(FILE_EXTENSIONS),-name "*.$(ext)") \)

# Exclude the Makefile when finding files.
EXCLUDE_MAKEFILE = -not -name "Makefile"

all: symlink

symlink: $(patsubst $(SOURCE_DIR)/%, $(TARGET_DIR)/%, $(shell $(FIND_COMMAND) $(EXCLUDE_MAKEFILE)))

$(TARGET_DIR)/%: $(SOURCE_DIR)/%
	@if [ ! -L $@ ]; then \
		mkdir -p $(@D); \
		ln -s $< $@; \
	fi

