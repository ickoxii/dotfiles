# Bash Config Files

`.bash_profile`, `.bashrc`, `.bash_aliases`, and `.bash_prompt` are
configuration files for the **B**ourne **A**gain **SH**ell (bash). On most Linux
systems, it starts an interactive non-login shell, so it reads `.bashrc`. If you
log in to a system via ssh, it starts an interactive login shell, so it reads
`.bash_profile` (unless configured otherwise).

On macOS, however, opening terminal starts an interactive login shell by
default. That means that macOS will initially source `.bash_profile` first
instead of `.bashrc`. Only when opening an interactive non-login bash shell
(such as when opening a terminal in vim) will macOS source `.bashrc` instead of
`.bash_profile`.

`.bash_aliases` and `.bash_prompt` are files that contain additional
configuration. Their contents are separated from `.bash_profile` and `.bashrc`
to maintain organization. `.bash_aliases` and `.bash_prompt` are both sourced
from either `.bash_profile` or `.bashrc`.

These four files are typically found in the home directory (`~/`). In my case, I
have consolidated all my .dotfiles in one repository, and use symlinks to link
each config file to the location where they are meant to be sourced from. This
allows for ease of access when wanted to change configurations for multiple
applications.

### macOS Specifics

On typical Linux distros, basic configuration is first handled by `.bashrc`.
`.bashrc` configures user paths, then sources `.bash_aliases` to add command
line short cuts (aliases) and `.bash_prompt`, which typically is used to
configure what is printed on the command line before the user inputs a command.

Common practice is to source the `.bash_aliases` and `.bash_prompt` files from
the `.bashrc` configuration file. On macOS however, `.bash_profile` is sourced
first. If we configure paths in `.bash_profile`, then source `.bash_aliases` and
`.bash_prompt` from our `.bash_profile`, issues will occur when opening an
interactive non-login bash shell (such as a terminal in vim). 

Recall that our paths were configured in `.bash_profile`, and `.bash_aliases`
and `.bash_prompt` are sourced through `.bash_profile`. This means that in a vim
terminal, for example, we will be using macOS default paths, aliases, and
prompts.

#### Fixing the Problem

To remedy this problem, we can handle all our path configuration and sourcing
of the alias and prompt files in `.bashrc`. This will allow us to use our paths,
aliases, and customized prompt when using an interactive non-login shell. Then,
to make sure that these customizations are reflected in our default macOS
terminal, we can source `.bashrc` from `.bash_profile`.

This makes our source flow look like the following:

###### Interactive non-login shell (terminal in vim, macOS)

    > `.bashrc` sourced
    > paths configured in `.bashrc`
    >> `.bash_aliases` sourced from within `.bashrc`
    >> `.bash_prompt` sourced from within `.bashrc`

###### Interactive login shell (default macOS)

    > `.bash_profile` sourced
    >> `.bashrc` sourced from `.bash_profile`
    >> paths configured in `.bashrc`
    >>> `.bash_aliases` sourced from within `.bashrc`
    >>> `.bash_prompt` sourced from within `.bashrc`
    > call neofetch from `.bash_profile` only (to not clutter vim terminal)

## `.bash_profile` and `.bashrc`

`.bash_profile` and `.bashrc` are both files which set up configurations when
first logging into a shell session. Remember, `.bash_profile` is sourced when
opening an interactive login shell (default on macOS). `.bashrc` is sourced
when opening an interactive non-login shell (default on Linux, opening a
terminal in vim on macOS).

## `.bash_aliases`

`.bash_aliases` is a dedicated place for command aliases. This keeps them
organized and separate from other configurations. This allows for a more
organized setup, especially if you have a lot of aliases (or a lot of
configurations).

## `.bash_prompt` and the `PS1` Environment Variable

`PS1` is an environment variable that defines the primary prompt string in Bash.
The primary goal is to give information and context to users for every command
line. There are many commands that can be passed through the `PS1` variable to
print information. A list of these commands can be found using a simple Google
search.
