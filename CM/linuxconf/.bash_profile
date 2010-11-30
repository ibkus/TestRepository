# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

umask 002

# User specific environment and startup programs

#Set your full name and your e-mail address (this will be used for commits):
git config --global user.name "Bohumil Kus"
git config --global user.email "Bohumil.Kus@teleca.com"

PATH=$PATH:~/bin/

export PATH
export http_proxy=http://10.20.2.16:8080/
export EDITOR=nano
export DATE_STAMP=$(date +\%G-\%m-\%d_\%H-\%M)

#-------------------------------------------------------------
# Automatic setting of $DISPLAY (if not set already).
# This works for linux - your mileage may vary. ...
# The problem is that different types of terminals give
# different answers to 'who am i' (rxvt in particular can be
# troublesome).
# I have not found a 'universal' method yet.
#-------------------------------------------------------------

function get_xserver ()
{
case $TERM in
xterm )
XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' )
# Ane-Pieter Wieringa suggests the following alternative:
# I_AM=$(who am i)
# SERVER=${I_AM#*(}
# SERVER=${SERVER%*)}

XSERVER=${XSERVER%%:*}
;;
aterm | rxvt)
# Find some code that works here. ...
;;
esac
}

if [ -z ${DISPLAY:=""} ]; then
get_xserver
if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) || \
${XSERVER} == "unix" ]]; then
DISPLAY=":0.0"          # Display on local host.
else
DISPLAY=${XSERVER}:0.0  # Display on remote host.
fi
fi

export DISPLAY

git config --global alias.show-graph 'log --graph --abbrev-commit --pretty=oneline'
git config --global alias.show-graph-topo "log --graph --pretty=format:'%h : %s' --topo-order"
git config --global alias.show-graph-date "log --graph --pretty=format:'%h : %s' --date-order"
git config --global alias.lg "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr %an)%Creset' --abbrev-commit --date=relative"
git config --global alias.wipe '!git reset --hard;git clean -fd'
git config --global color.ui auto
git config --global core.editor "nano -Y patch"
alias ..='cd ..'
alias l='ls -la --color=yes'
alias lt="ls --color=yes --time-style='+%d-%m-%Y %H:%M:%S' -la"

# New environment setting added by Sourcery G++ Lite for ARM GNU/Linux on Mon Nov 22 15:54:05 CET 2010 1.
# The unmodified version of this file is saved in /home/deinboku/.bash_profile682375192.
# Do NOT modify these lines; they are used to uninstall.
PATH="$PATH:/net/grp_flextronics/001_PRJ_FW_EXT_PHONE_SVCS/50_Integration/tools/arm-2009q1/bin"
export PATH
# End comments by InstallAnywhere on Mon Nov 22 15:54:05 CET 2010 1.
