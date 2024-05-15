#!/bin/bash
# Obfuscated Bash Script

if [ $# -ne 1 ]; then 
    echo "Usage: $0 <identifier>" 
    exit 1 
fi
identifier=$1

# Function to change MAC address
change_mac() {
    interface=$1
    new_mac=$(openssl rand -hex 6 | sed 's%\(..\)%\1:%g; s%.$%%')
    if sudo ifconfig $interface ether $new_mac; then
        echo "Changed MAC address of $interface to $new_mac"
    else
        echo "Failed to change MAC address of $interface"
    fi
}

# Function to change the MAC address of en0 to a random address
change_mac_en0() {
    interface="en0"
    new_mac=$(openssl rand -hex 6 | sed 's%\(..\)%\1:%g; s%.$%%')
    echo "Generated new MAC address: $new_mac"
    
    # Bring the interface down
    sudo ifconfig $interface down
    
    # Change the MAC address
    if sudo ifconfig $interface ether $new_mac; then
        echo "Changed MAC address of $interface to $new_mac"
    else
        echo "Failed to change MAC address of $interface"
    fi
    
    # Bring the interface up
    sudo ifconfig $interface up
}

# Execute the MAC address change for en0
change_mac_en0

# Function to check if an interface has an IP address
check_ip_assigned() {
    interface=$1
    if [[ $(ifconfig $interface | grep "inet " | awk '{print $2}') ]]; then
        echo "IP assigned to $interface"
        return 0
    else
        echo "No IP assigned to $interface"
        return 1
    fi
}

# Function to cycle network interfaces
cycle_interfaces() {
    for interface in $(networksetup -listallhardwareports | awk '/Device/ {print $2}'); do
        if [[ "$interface" != "lo0" && "$interface" != "gif0" && "$interface" != "stf0" && "$interface" != "bridge0" && "$interface" != "utun0" && "$interface" != "utun1" && "$interface" != "utun2" && "$interface" != "utun3" ]]; then
            sudo ifconfig $interface down
            sleep 1
            sudo ifconfig $interface up
            change_mac $interface
            if ! sudo ipconfig set $interface DHCP; then
                echo "Failed to set DHCP for $interface"
            fi
        fi
    done
}

# Function to ensure at least one interface has an IP address before manipulating routing table
ensure_ip_assigned() {
    for interface in $(networksetup -listallhardwareports | awk '/Device/ {print $2}'); do
        if [[ "$interface" != "lo0" && "$interface" != "gif0" && "$interface" != "stf0" && "$interface" != "bridge0" && "$interface" != "utun0" && "$interface" != "utun1" && "$interface" != "utun2" && "$interface" != "utun3" ]]; then
            sudo ifconfig $interface up
            for attempt in {1..5}; do
                if sudo ipconfig set $interface DHCP; then
                    sleep 3
                    if check_ip_assigned $interface; then
                        return 0
                    fi
                else
                    echo "Failed to set DHCP for $interface on attempt $attempt"
                fi
                sleep 3
            done
        fi
    done
    echo "No IP assigned to any device, cannot proceed with routing table manipulation"
    return 1
}

# Function to manipulate routing table
manipulate_routing() {
    if ensure_ip_assigned; then
        sudo route -n flush
        sudo route add default 192.168.1.1
        echo "Routing table manipulated with identifier: $identifier"
    else
        echo "Routing table manipulation skipped due to lack of IP assignment"
    fi
}

# Execute functions
cycle_interfaces
manipulate_routing

echo "Network interfaces cycled and routing table manipulated with identifier: $identifier"

# Call Lisp script using a Lisp interpreter (e.g., clisp, sbcl)
clisp ./scripts/obfuscated_lisp_script.lisp $identifier
