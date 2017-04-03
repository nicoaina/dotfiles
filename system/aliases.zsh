alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias l='ls -la --color=auto'
alias ..='cd ..'

alias copy='xsel --clipboard --input'
alias paste='xsel --clipboard --output'

alias junitfailure='grep -P "(Errors|Failures): [1-9]"'

alias mavenjunitfailure='grep -P "(Errors|Failures): [1-9]" **/target/surefire-reports/*.txt'
alias maventests='for i in `find . -type d -name surefire-reports` ; do echo $i : `grep "Tests run: " $i/*.txt | cut -d " " -f 3 | tr -s "\n" " " | sed -e "s/,/ +/g" -e "s/$/0\n/" | bc` ; done'
alias topmemproc='ps aux|head -1;ps aux |tail -n+1 |sort -nrk4 |head -$(($(tput lines)-2)) |cut -c 1-$(tput cols)' # Alias with header 
alias ducks='du -cms -- * .* | sort -rn | head || du -cms -- * | sort -rn | head'
alias cpuinfo=" cpufreq-info | grep -P 'comprise entre|actuelle' | grep -e '[0-9.]*'" 
alias myip='curl ifconfig.me'
alias free="LANG=C free"

# Curl
alias get='curl -X GET -H "Accept:application/json"'
alias post='curl -X POST -H "Accept:application/json" -H "Content-Type:application/json" -d'
alias put='curl -X PUT -H "Accept:application/json" -H "Content-Type:application/json" -d'
alias patch='curl -X PATCH -H "Accept:application/json" -H "Content-Type:application/json" -d'
alias delete='curl -X DELETE -H "Content-Type:application/json"'
alias options='curl -X OPTIONS -H "Content-Type:application/json"'
alias json='curl -H "Accept: application/json" -L'

#alias mvn='/usr/local/bin/mvnc -T2.0C'
alias grin='grep -Hrn'
alias fin="find . -name"
alias finsrc="find src -name"

alias addtime='xargs -d"\n" -I {} date +"%Y-%m-%d %H:%M:%S {}"'

# Eliminer les commentaires d'un fichier
alias cgrep="grep -E -v '^(#|$|;)'"
alias nocomment='cgrep'

# Être gentil avec les ressources de son système
function nicecool() {
    if ! [ -z "$1" ] 
    then
        # Prendre en paramètre un pid
        ionice -c3 -p$1 ; renice -n 19 -p $1
    else
        # Si il n'y a pas de paramètre on nice le pid courant (le bash)
        ionice -c3 -p$$ ; renice -n 19 -p $$
    fi
}
alias niceprod="nicecool"
alias np="nicecool"

function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
alias extract="extract"
alias unall="extract"

# Bannir l'IP d'un méchant rapidement
function ban() {
    if [ "`id -u`" == "0" ] ; then
        iptables -A INPUT -s $1 -j DROP
    else
        sudo iptables -A INPUT -s $1 -j DROP
    fi
}
alias ban="ban"

# Divers petits raccourcis : 
alias grepr='grep -r'
alias tree="find . | sed 's/[^/]*\\//|   /g;s/| *\\([^| ]\\)/+--- \\1/'"
#alias mkdir='mkdir -pv'
alias pg='ps aux | grep'
alias pl='ps faux | less'
#function mkcd () { mkdir $1 && cd $1 }
function mkcd() { mkdir -p "$@" && cd "$_"; }
alias mkcd="mkcd"
alias rsync="rsync --progress"

alias gff="git fetch -p --all"
alias gbr='git for-each-ref --sort="-authordate:iso8601" --format=" %(color:green)%(authordate:iso8601)%09%(color:white)%(refname:short)" refs/heads'

alias cpuperf='for i in "0 1 2 3 4 5 6 7" ; do sudo cpufreq-set -c $i -g performance ; echo $i ; done'

alias dockerip='docker ps | tail -n +2 | while read cid b; do echo -n "$cid\t"; docker inspect $cid | grep IPAddress | cut -d \" -f 4; done'
alias dockip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias battery_stat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

alias jjabber="cd ~/.purple/logs/jabber/wd-dw@jabber.deveryware.net"

export SBT_OPTS=-XX:MaxPermSize=256m
#alias terraform='DOCKER_HOST= docker run --rm --net=host --user=$UID:$GID -v $PWD:/data -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" -ti uzyexe/terraform'
alias nova='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient nova'
alias neutron='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient neutron'
alias openstack='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient openstack'
alias glance='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" -e OS_IMAGE_API_VERSION="1" -v $PWD:/data twillouer/mydocker:openstackclient'
alias glance-add-iso='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" -e OS_IMAGE_API_VERSION="1" -v $PWD:/data twillouer/mydocker:openstackclient glance image-create --progress --disk-format=qcow2 --name $1 --container-format=bare  --file /data/$2'

alias generate_password='cat /dev/urandom | tr -dc A-Z-a-z-0-9 | head -c${1:-16} ; echo'

