#!/bin/sh
function demonize {
    pid="/tmp/__$1.pid"
    # if no pid file or no process
    if [ ! -f "$pid" ] || ! kill -0 `cat $pid` 2>/dev/null; then
        $2 > /dev/null 2>&1 &
        echo $! > $pid
    fi
}

xset -b
xmodmap ~/.Xmodmap
xbindkeys -p &
demonize twmnd twmnd
exec i3
