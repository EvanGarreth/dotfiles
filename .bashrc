#source ~/.dotfiles/.bashrc

 alias myip='curl -s checkip.dyndns.org | cut -f 6 -d " " | cut -f 1 -d "<"'
 alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'

 export EDITOR=nano

 # colors and such
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ssh-skout='ssh spectre@skout.xyz'

# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Add to history instead of overriding it
shopt -s histappend

# History lenght
HISTSIZE=1000
HISTFILESIZE=2000

# Window size sanity check
shopt -s checkwinsize

# User/root variables definition
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Colored XTERM promp
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
    else
    color_prompt=
    fi
fi

# Prompt
#if [ -n "$SSH_CONNECTION" ]; then
#export PS1="\[$(tput setaf 1)\]┌\[$(tput setaf 7)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└──\[$(tput setaf 7)\][ssh]\"; else echo \"\[$(tput setaf 1)\]└──\[$(tput setaf 7)\][ssh]\"; fi) \[$(tput setaf 7)\]"
#else
#export PS1="\[$(tput setaf 1)\]┌\[$(tput setaf 7)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└──\"; else echo \"\[$(tput setaf 1)\]└──\"; fi) \[$(tput setaf 7)\]"
#fi

#PS1="[\[\e[1;37m\]\W\[\e[0m\]]\[\e[1;37m\]:\[\e[0m\] "
export PS1="[\u@\h \W]\\$ \[$(tput sgr0)\]"

# ls after a cd
function cd()
{
 builtin cd "$*" && ls
}

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
