#!/usr/bin/env bash
# Make nano the default editor.
export EDITOR='nano';

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;

# NVM Dir
export NVM_DIR="$HOME/.nvm"

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="$HISTSIZE";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# timestamps for bash history. www.debian-administration.org/users/rossen/weblog/1
# saved for later analysis
HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT

# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';

# Please don't set LC_ALL here. It is the mother of all LC's, meaning it will override
# all LC settings. I need this 'cause I run scripts that use LC_CTYPE C (system default) instead of
# a defined locale. Also read http://unix.stackexchange.com/questions/87745/what-does-lc-all-c-do

# Highlight section titles in manual pages.
# shellcheck disable=2154
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# JAVA
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

# GPG
export GPG_TTY=$(tty)

# Ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
