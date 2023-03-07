
alias vo="vim -o \`fzf :Files %:p:h\`"
alias lh="ls -lh"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#alias update='sudo apt-get update'
alias kil='kill -9'


alias mvn8="JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 && mvn"
alias mvn11="JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 && mvn"
alias python="/usr/bin/python3.7"
alias hh="cd ~/" 
alias cdls='cd "$@" && ls'
alias updateAll='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias fzf="fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}'"
alias ports='ss -tulpn | grep LISTEN | more' 
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
