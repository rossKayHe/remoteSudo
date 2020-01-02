# remoteSudo

Alllows use of sudo commands on remote hosts

## Usage<br>
`   remoteSudo.sh <user> <command> <host file||comma delimited list>`<br>

## Requirement
Requires sshpass
Install with<br>
`  yum install sshpass -y`

  
## Testing results
<pre>userid@y0319t11229:~$ ./remoteSudo.sh userid 'ls /etc/audit' ./hosts
Password: *myPassword*
Warning: Permanently added 'y0319t12479,10.19.216.52' (RSA) to the list of known hosts.
Enter your password on host y0319t12479:auditd.conf
audit.rules
rules.d
Warning: Permanently added 'y0319t12480,10.19.216.54' (RSA) to the list of known hosts.
Enter your password on host y0319t12480:auditd.conf
audit.rules
rules.d
Warning: Permanently added 'y0319t12481,10.19.216.56' (RSA) to the list of known hosts.
Enter your password on host y0319t12481:auditd.conf
audit.rules
rules.d
Warning: Permanently added 'y0319t12484,10.19.216.55' (RSA) to the list of known hosts.
Enter your password on host y0319t12484:auditd.conf
audit.rules
rules.d
Warning: Permanently added 'y0319t12485,10.19.216.53' (RSA) to the list of known hosts.
Enter your password on host y0319t12485:auditd.conf
audit.rules
rules.d</pre>

## Additional Info
The bash script will split commands on semicolon if it exists in the command string and run each  of the commands with sudo.  This results as each command being a separate ssh session to the host.

The PowerShell script can use the same session to run multiple commands.

## Inspired by 
PowerShell Posh-SSH
(also included in the repo)
