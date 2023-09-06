# Using Vim's `autocmd` and Skeleton Files for File Templates

In Vim, the `autocmd` feature can be used to automatically execute commands based on specific events and file patterns. Combined with skeleton files, this provides a way to have templates when you create new files.

## 1. Create a Skeleton File

Say you want to have a template for Python files. Here's how you'd create a skeleton:

1. First, create a skeleton file:

    ```bash
    mkdir -p ~/.vim/skeletons
    echo '#!/usr/bin/env python3\n\n' > ~/.vim/skeletons/python.skel
    ```

    This simple skeleton starts with a shebang for Python 3 and two newline characters.

## 2. Update Your Vim Configuration

Now, integrate this skeleton into your Vim setup:

1. Open your Vim configuration:

    ```bash
    vim ~/.vimrc
    ```

2. Add the following `autocmd` configuration:

    ```vim
    " Ensure that the autocmds are grouped to prevent duplications
    augroup filetemplates
        autocmd!
        " For Python files
        autocmd BufNewFile *.py 0r ~/.vim/skeletons/python.skel
    augroup END
    ```

    The `BufNewFile` event fires when you create (or open) a file that doesn't exist yet. The `0r` reads the skeleton file into the buffer at line 0.

## 3. Use Vim to Create a New File

With the setup complete, creating a new Python file:

```bash
vim newfile.py
```

## Editing the File in Vim

Now that you opened the file template, you can change the name of the current
file while in vim by using `:file file_name` followed by `:w` to save your new
file.
