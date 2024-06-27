# Gate Router 🚀

## Table of Contents
1. [Introduction](#introduction)
2. [Setting Execution Permissions](#setting-execution-permissions-🔒)
3. [Running the Command](#running-the-command-🛠️)
4. [Explanation](#explanation-🧠)
5. [Why this is a useful repository, and is more then just changing your MAC address] (#about-😀)

---

## Introduction
Welcome to the Gate Router project! This project includes a set of scripts that need to be executed in a specific sequence to perform various tasks. Follow the instructions below to set the necessary permissions and run the scripts correctly.

---

## Setting Execution Permissions 🔒
**First, make the scripts executable:**

chmod +x ./scripts/quantum_run_script.py
chmod +x ./scripts/obfuscated_bash_script.sh
chmod +x ./scripts/obfuscated_lisp_script.lisp
chmod +x ./scripts/change_mac_en0.sh

---
next install clisp and sbcl on your unix or unix-like system
---

## Running the Command 🛠️
**Next, run the command to execute the scripts:**

identifier=$(python3 ./scripts/quantum_run_script.py | awk '{print $NF}')
./scripts/change_mac_en0.sh
./scripts/obfuscated_bash_script.sh $identifier


---

## Explanation 🧠
---
# chmod +x ./scripts/quantum_run_script.py

This command makes the quantum_run_script.py script executable.
#
---
# chmod +x ./scripts/obfuscated_bash_script.sh

This command makes the obfuscated_bash_script.sh script executable.
#
---
# chmod +x ./scripts/obfuscated_lisp_script.lisp

This command makes the obfuscated_lisp_script.lisp script executable.

# chmod +x ./scripts/change_mac_en0.sh
---
This command makes the change_mac_en0.sh script executable.
#
---
# identifier=$(python3 ./scripts/quantum_run_script.py | awk '{print $NF}')

This command runs the quantum_run_script.py script, captures the last field of its output using awk, and assigns it to the identifier variable.
#
---
# ./scripts/change_mac_en0.sh

This command runs the change_mac_en0.sh script to change the MAC address of the en0 interface.
#
---
# ./scripts/obfuscated_bash_script.sh $identifier

This command runs the obfuscated_bash_script.sh script, passing the identifier as an argument.
#
---

By following these steps, you ensure that your environment is set up correctly for running the quantum and obfuscated scripts, enhancing both security and functionality. 🌟
---
## about 😉

This is a project designed to route your IP tables and reset them and change all your MAC addresses on your network interfaces that are applicable on MacOS or Linux. Aside the tunneling or otherwise other purpose network interface cards. This is good for privacy and bypassing MAC based network filters on public wifis. this also sets a new IP address on your router. Doing a throuroigh job at changing your hardware fingerprint on networks! Due to backwards compatibility, some things may not be successful on Linux or Mac.
