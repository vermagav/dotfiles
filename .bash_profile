### My custom bash profile.

### Sources and Credits:
#     https://github.com/mathiasbynens/dotfiles
#     https://github.com/gf3/dotfiles

### New machine? Useful productivity tools:
#     ack replacement: https://github.com/ggreer/the_silver_searcher
#     vim easymotion: https://github.com/easymotion/vim-easymotion
#     <add more here>

### .bash_profile begins here:

# Add `~/bin` to `$PATH`
export PATH="$HOME/bin:$PATH";

# Source additional files
# .bash_prompt: shell prompt
# .bash_local: specific to local machine, not committed to git
for file in ~/.{bash_prompt,bash_local}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}"               # all files, in long format
alias la="ls -laF ${colorflag}"             # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Custom Aliases
alias ll='ls -l'
alias cdgo='cd $GOROOT'
