# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#source ~/.git-prompt.sh

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# chech whether we are in tmux or not
if ! { [ "$TERM" = "screen-256color" ] && [ -n "$TMUX" ]; } then
  TMUX_SHELL=no
else
  TMUX_SHELL=yes
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    COLOR_DEFAULT_FG="\e[39m"
    COLOR_RED="\e[0;31m"
    COLOR_YELLOW="\e[1;33m"
    COLOR_GREEN="\e[0;32m"
    COLOR_LIGHT_GREEN="\e[1;32m"
    COLOR_OCHRE="\e[38;5;95m"
    COLOR_BLUE="\e[1;34m"
    COLOR_WHITE="\e[1;37m"
    RESET_ALL="\e[0m"
    RESET_BOLD="\e[21m"

    function git_warning {
      local git_status="$(git status 2> /dev/null)"

      if [[ ! $git_status == "" ]]; then
          if [[ ! $git_status =~ "working directory clean" ]]; then
            echo " [*]"
          elif [[ $git_status =~ "Your branch is ahead of" ]]; then
            echo " [*]"
          fi
      fi
    }

    PS1="${debian_chroot:+\($debian_chroot)}"

    if [ "$TMUX_SHELL" = "yes" ]; then
      function tmux_PS1 {
        local git_status="$(git status 2> /dev/null)"

        if [[ ! $git_status == "" ]]; then
          if [[ ! $git_status =~ "working directory clean" ]]; then
            echo -e "$COLOR_RED"
          elif [[ $git_status =~ "Your branch is ahead of" ]]; then
            echo -e "$COLOR_RED"
          else
            echo -e "$COLOR_LIGHT_GREEN"
          fi
        else
            echo -e "$COLOR_BLUE"
        fi
      }

      PS1+="\[\$(tmux_PS1)\]➔ \[$RESET_ALL\]" #"\$(tmux_PS1)➔ $RESET_ALL"

    else
      PS1+="\[$COLOR_OCHRE\][host] \[$COLOR_DEFAULT_FG\]"
      PS1+="\[$COLOR_BLUE\]\u\[$COLOR_WHITE\]\[$COLOR_DEFAULT_FG\]:"
      PS1+="\[$COLOR_WHITE\]\w\[$COLOR_DEFAULT_FG\]"          # basename of pwd
      PS1+="\[$COLOR_YELLOW\]\$(__git_ps1 ' (%s)')\[$COLOR_DEFAULT_FG\]"           # prints current branch
      PS1+="\[$COLOR_RED\]\$(git_warning)\[$COLOR_DEFAULT_FG\]"
      PS1+=" \[$COLOR_BLUE\]\$\[$COLOR_DEFAULT_FG\]\[$RESET_ALL\] "   # '#' for root, else '$'
    fi

    export PS1
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=$PATH:~/.vimpkg/bin

source /opt/ros/kinetic/setup.bash
