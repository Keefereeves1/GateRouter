interface="en0"
new_mac=$(openssl rand -hex 6 | sed 's%\(..\)%\1:%g; s%.$%%')
echo "Generated new MAC address for $interface: $new_mac"
