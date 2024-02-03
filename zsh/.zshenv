# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Python packages
# eval "$(/Users/ickoxii/Library/Python/3.9/lib/python/site-packages)"
# ^ permission denied

# Set location of additional zsh configuration
export ZDOTDIR=~/.config/zsh

# >>>> Java >>>>

# Maven
export M2_HOME="/Users/ickoxii/bin/apache-maven-3.9.6"
PATH="${M2_HOME}/bin:${PATH}"
export PATH

# JAVA_HOME (for JDK)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
PATH="${JAVA_HOME}/bin:${PATH}"
export PATH

# <<<< Java <<<<

# >>>> Options >>>>
# Should probably move to its own file
BAT_THEME=base16
