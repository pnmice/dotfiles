# .bash_profile


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs


PATH=$PATH:$HOME/bin

export EDITOR="vim"
export PATH
unset USERNAME



alias master='git checkout master'
alias st='open -a "Sublime Text"'
alias server="python -m SimpleHTTPServer"
alias p="cd ~/projects"


alias s1='vim /etc/hosts'
alias s2='vim /etc/sysconfig/network'
alias s3='vim /etc/postfix/main.cf'
alias s4='vim /etc/varnish/default.vcl'
alias s5='vim /etc/httpd/conf.d/mod_rpaf.conf'


#alias killsound='sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk {'print $1'}`'
alias acheck='ansible-playbook --syntax-check --list-tasks'
alias updatedb='/usr/libexec/locate.updatedb'
alias yumsearch='yum list --enablerepo=epel'
alias drupalfix='find . -type f -exec sed -i "s/FollowSymLinks/SymLinksIfOwnerMatch/g" {} \;'
alias apf='/usr/local/sbin/apf'
alias psa='ps afx'
alias tail100='tail -n 100'
alias vi='vim'
alias yum='yum -y'
alias webminpass='/usr/libexec/webmin/changepass.pl /etc/webmin root'
alias ht='echo Options +SymLinksIfOwnerMatch'
alias ps10='ps -auxf | sort -nr -k 4 | head -10'
alias cpu10='ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10'
alias qchwr='drush pml --no-core --type=module --status=enabled --pipe | xargs drush -y dis'
alias repo='sed -n -e "/^\[/h; /priority *=/{ G; s/\n/ /; s/ity=/ity = /; p }" /etc/yum.repos.d/*.repo | sort -k3n'
alias psx="ps -eo pcpu,pid -o comm= | sort -k1 -n -r | head -12"
alias psg="ps fuxa |grep $1"
alias psm="ps -eo pmem,pcpu,rss,vsize,args | sort -k 1 -r | less"
alias recall="history |grep $1"
alias eba='vim ~/.bash_profile'
alias lba='source ~/.bash_profile'
alias ?='history'  # DISPLAYS HISTORY
alias l='ls -l'
alias x='exit'
alias diff='colordiff'
alias l.='ls -dl .* --color=auto'

alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

mkdircd () { mkdir -p "$@" && eval cd ""\$$#""; }

userprompt () {
local usercolor="\[\033[1;36m\]"
[[ $EUID == 0 ]] && usercolor="\[\033[1;31m\]"
PS1="$(pwd)"
PS1="$usercolor\u\[\033[0m\]@\[\033[1;34m\]\H\[\033[0m\]:${PS1//\//$usercolor/\[\033[0;1m\]}$usercolor\\$\[\033[0m\]
"
}
PROMPT_COMMAND=userprompt

tardir () {
tar cvzf ${1}.tgz ${1}
}
# Extract compressed file
extract () {
  if [ -f $1 ] && [ -r $1 ] ; then
    case $1 in
      (*.tar.bz2|*.tbz2)  tar xjf $1;;
      (*.tar.gz|*.tgz)    tar xzf $1;;
      (*.bz2)             bunzip2 $1;;
      (*.rar)             rar x $1;;
      (*.gz)              gunzip $1;;
      (*.tar)             tar xf $1;;
      (*.zip)             unzip $1;;
      (*.Z)               uncompress $1;;
      (*.7z)              7z x $1;;
      (*.deb)             sudo dpkg -i $1;;
      (*.rpm)             sudo alien -dik $1;;
      (*)                 echo "extract: unsupported format $1" ;;
  esac
    rm -rf $1
    ls -l
  else
    echo "extract: file not found or unreadable: $1"
  fi
}

# Find a file with a pattern in file name
function fn() { find . -type f -iname '*'$1'*' -ls ; }
# Find a file with a patter in the content of the file
function fs() { grep -Ril "$1" .; }


function check_hack() {
for i in $(find /home/*/public_html -type d -prune); do if [ -d $i ]; then find $i -type f -name '*.php' | xargs grep -l 'eval *(' --color && find $i -type f -name '*.php' | xargs grep -l 'base64_decode *(' --color && find $i -type f -name '*.php' | xargs grep -l 'gzinflate *(' --color && find $i -size 494c -name '*.php' && grep -Rl PCT4BA6ODSE $i; fi; done
}

function check_drupal() {
for i in $(find /home/*/public_html -type d -prune); do drush -r $i status | grep Drupal; done
}

alias fix-sl='find . -type f -name .htaccess -exec sed -i "s/FollowSymLinks/SymLinksIfOwnerMatch/g" {} \; && find . -type f -name file.inc -exec sed -i "s/FollowSymLinks/SymLinksIfOwnerMatch/g" {} \;'

alias check_q='/usr/sbin/postqueue -p'


chownuser () {
user=`pwd | cut -d '/' -f3`
chown -R $user.$user .
}

audit () {
drush dl site_audit && drush dl drupalgeddon && drush cache-clear drush && drush asec
}








