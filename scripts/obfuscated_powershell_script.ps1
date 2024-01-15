
# Obfuscated PowerShell Script
param([string]$x)
if ($# -ne 1) { Write-Host "Usage: $($MyInvocation.InvocationName) x" -ForegroundColor Red ; Exit 1 }
$y = (z -Prompt "MSG5")
if ($lastExitCode -ne 0) { Exit -1 }
$LISP_SCRIPT/a4.lisp $y
