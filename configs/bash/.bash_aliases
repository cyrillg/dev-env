# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lF'

# Necessary to avoid lag in the tmux bar updates when changing directory
if [ "$TMUX_SHELL" = "yes" ]; then
  function cd() {
    new_directory="$*"
    if [ $# -eq 0 ]; then
      new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && tmux refresh-client -S
  }
fi
