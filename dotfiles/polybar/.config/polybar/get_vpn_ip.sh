#!/bin/bash

get_vpn_ip() {
    if ip link show tun0 > /dev/null 2>&1; then
        vpn_ip=$(ip addr show tun0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
        if [ -z "$vpn_ip" ]; then
            echo "VPN Down"
        else
            echo "$vpn_ip"
        fi
    else
        echo "VPN Down"
    fi
}

copy_vpn_ip() {
    vpn_ip=$(get_vpn_ip)
    echo -n "$vpn_ip" | xclip -selection clipboard
}

case "$1" in
    --copy)
        copy_vpn_ip
        ;;
    *)
        get_vpn_ip
        ;;
esac
