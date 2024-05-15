
Quantum Project Folder
======================

This folder contains scripts for running quantum operations with classical quantum interference and associated tools.

Contents:
- /scripts/quantum_run_script.py: The main quantum run script.
- /scripts/obfuscated_lisp_script.lisp: Obfuscated Lisp script.
- /scripts/obfuscated_bash_script.sh: Obfuscated Bash script.
- /scripts/obfuscated_powershell_script.ps1: Obfuscated PowerShell script.
- run.ps1: PowerShell runner to start the quantum run script.

The primary purpose of the script is to change the MAC addresses of network interfaces on a system, 
ensuring that these changes are propagated correctly by manipulating the routing table.
 This can serve various purposes, including security, privacy, and network management.

Why Change MAC Addresses?

Privacy:

Tracking Prevention: MAC addresses are unique identifiers for network interfaces. Changing them regularly can help prevent tracking by making it harder to associate network traffic or device behavior with a specific device over time.
Anonymity: In public or monitored networks, regularly changing the MAC address can help maintain user anonymity.
Security:

Bypass MAC-based Filtering: Some networks use MAC-based access control. Changing the MAC address can be used to bypass these restrictions (although this is typically against network policies and should only be done for legitimate purposes).
Network Management:

Testing and Troubleshooting: Network administrators might change MAC addresses to test network configurations or resolve conflicts.
Resource Management: Some networks assign IP addresses and resources based on MAC addresses. Changing the MAC address can be used to force new IP assignments.
Script Overview and Functionality
Changing MAC Addresses:

The script generates a new random MAC address for each network interface (except for specific excluded interfaces like loopback and tunneling interfaces).
It uses ifconfig or ip commands to apply these changes, depending on the operating system (macOS or Linux).

Network Interface Cycling:

The script brings network interfaces down and back up to ensure that the MAC address changes take effect.
It requests a new DHCP lease for each interface to ensure it gets a new IP address based on the new MAC address.
Routing Table Manipulation:

Flushing Existing Routes: The script flushes the existing routing table to clear out any stale or invalid routes.
Adding a Default Route: It then adds a default route to ensure that network traffic is directed correctly. This step ensures that the system remains connected to the network after changing MAC addresses and IP configurations.
Why Manipulating the Routing Table is Secure
Consistency:

Ensuring Connectivity: After changing MAC addresses and reconfiguring network interfaces, the system’s routing table needs to be updated to reflect these changes. Manipulating the routing table ensures that the system can still route network traffic correctly.
Preventing Network Issues: By flushing the old routes and setting a new default route, the script helps prevent network misconfigurations that could lead to connectivity issues.
Controlled Environment:

Specific Gateway: The script sets a specific default gateway (192.168.1.1). This assumes a known, controlled environment where the gateway is reachable and configured correctly.
Error Handling: The script includes checks to ensure the gateway is reachable before making changes, minimizing the risk of network disruption.
Dynamic Networks:

Handling DHCP: In dynamic networks where IP addresses are assigned via DHCP, the script ensures that each interface gets a new IP address, which is important for maintaining correct network configurations after MAC address changes.
In-Depth Explanation of the Script
1. Function to Change MAC Address (macOS and Linux)

On top of changing the Mac Addresses, it routes them through a gateway, where it manipulates and obfuscates the routing table with an. 

python installations:

pip3 install pennylane



mac installations: 
brew install clisp
brew install sblc 



For linux:
# For Debian-based systems
sudo apt-get install net-tools dhclient iproute2 clisp 

# For RPM-based systems
sudo dnf install net-tools dhclient iproute2 clisp

THEN: 
cd path/to/GATEROUTER

set permissions:
chmod +x ./scripts/quantum_run_script.py
chmod +x ./scripts/obfuscated_bash_script.sh
chmod +x ./scripts/obfuscated_lisp_script.lisp
chmod +x ./scripts/change_mac_en0.sh

run comamand: 
identifier=$(python3 ./scripts/quantum_run_script.py | awk '{print $NF}')
./scripts/change_mac_en0.sh
./scripts/obfuscated_bash_script.sh $identifier



