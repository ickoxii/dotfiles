# ZSH Configuration

## Login and Interactive Shells

It is important to understand the difference between types of shells that 
we may further understand which files are sourced when.  

<https://stackoverflow.com/questions/18186929/what-are-the-differences-between-a-login-shell-and-interactive-shell>  

***Tl;dr***  

1. A *login shell* is a shell where you login.
2. An *interactive shell** reads commands from its standard-input (usually a terminal)  

Ex: If you login to bash using a terminal emulator, the session is ***both*** 
a login shell and an interactive one.

Ex: If you type bash then you enter an interactive shell, but not a login shell  

* So, the terminal spawned by vim is probably interactive non-login  

Ex: A shell script runs a shell that is neither login nor interactive  

## List of Files and What They Do

<https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout>  

1. `.zshenv` is *always* sourced. It often contains exported variables that
   should be available to other programs. For example, `$PATH`, `$EDITOR`, 
   and `$PAGER` are often set in `zshenv`. Also, you can set `$ZDOTDIR` in 
   `zshenv` to specify an alternative location for the rest of your zsh 
   configuration.

2. `.zprofile` is for login shells. It is basically the same as `.zlogin` 
   except it is sourced before `.zshrc` whereas `.zlogin` is sourced after 
   `.zshrc`. According to the zsh documentation, "`.zprofile` is meant as 
   an alternative to `.zlogin` for ksh fans; the two are not intended to 
   be used together, although this could certainly be done if desired."

3. `.zshrc` is for interactive shells. You set options for the interactive 
   shell there with the `setopt` and `unsetopt` commands. You can also 
   load shell modules, set your history options, change your prompt, set 
   up zle and complete, etc. You also set any variables that are only 
   used in the interactive shell (e.g. `$LS_COLORS`).

4. `.zlogin` is for login shells. It is sourced on the start of a login 
   shell but after `.zshrc`, if the shell is also interactive. This file 
   is often used to start X using `startx`. Some systems start X on boot, 
   so this file is not always very useful.

5. `.zlogout` is sometimes used to clear and reset the terminal. It is called 
   when exiting, not when opening.

For my own use, I also create additional files that contain additional 
zsh configuration. Since these are not standard zsh files (to my knowledge), 
it is important to source them from `.zshrc`. 

6. `.zaliases` contains a list of aliases.

7. `.zprompt` is used to configure only the prompt, i.e.

```zsh
root (main) ~/dir/ >>
```

## Flow

`.zshenv` should be located in our home directory. We will consolidate the 
remainder of our configurations by setting `$ZDOTDIR` to `~/.config/zsh`. 
We also want our configurations to be consistent across interactive login 
shells (like the terminal), and interactive non-login shells (like the one 
spawned from vim). In order to do this, the only functionality of `.zprofile` 
is to source `.zshrc`, where the remainder of our configuring and sourcing 
will take place. 

so:  

```zsh
# .zshenv
ZDOTDIR = ~/.config/zsh/

# other paths go here (maybe)
```

```zsh
# .zprofile
source ~/.config/zsh/.zshrc
```

```zsh
# .zshrc
source ~/.config/zsh/.zprompt
source ~/.config/zsh/.zaliases
```
