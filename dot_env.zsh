# Setup for all my local dotfiles
# Load the shell dotfiles. Be aware, order is important here.
for file in ~/.{path,aliases,exports,functions}.zsh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;

# Load NVM
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Load rbenv
eval "$(rbenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/christiaanvanbemmel/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/christiaanvanbemmel/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/christiaanvanbemmel/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/christiaanvanbemmel/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
