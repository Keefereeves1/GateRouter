
#!/bin/bash
# Obfuscated Bash Script
if [ $# -ne 1 ]; then echo "Usage: $0 x" ; exit 1 ; fi
y=$(z)
if [ $? -ne 0 ]; then exit 1 ; fi
$LISP_SCRIPT/a4.lisp $y
