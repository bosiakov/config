#!/bin/bash
set -euo pipefail

hosts_file="/etc/hosts"
curr_user=$(whoami)

[ "$curr_user" == "root" ] || exit 1

reload_network()
{
uname=$(uname)

if [ "Linux" == "$uname" ]; then
    restart_network="/etc/init.d/networking restart"
elif [ "Darwin" == "$uname" ]; then
    restart_network="dscacheutil -flushcache"
else
    message="Unknown system"
    restart_network="echo $message"
fi

$restart_network
}

restart_browser() 
{
    read -p "Do you want to kill firefox to clear DNS cache? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        pkill -f firefox
    fi
}

play()
{
    sudo cp ~/.hosts/procrast_hosts $hosts_file
    reload_network
    echo "Work mode disabled at " "$(date)" >> ~/procrastination.log
    echo "Procrastionaton mode is on. Work mode disabled."
    restart_browser
}

work()
{
    sudo cp ~/.hosts/noprocrast_hosts $hosts_file
    reload_network
    { echo "Work mode enabled at " "$(date)"; echo "==="; } >> ~/procrastination.log
    echo "Work mode enabled. Procrastionaton is over."
    restart_browser
}


if [ $# -eq 0 ]; then 
    echo "ERROR: No command given"
    exit 1
fi

case $1 in
    "play")
        play ;;
    "work")
        work ;;
        *) exit 1 ;;
esac
