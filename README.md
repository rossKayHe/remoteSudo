# remoteSudo

Alllows use of sudo commands on remote hosts

## Usage<br>
`   remoteSudo.sh <user> <command> <host file||comma delimited list>`<br>

## Requirement
Requires sshpass
Install with<br>
`  yum install sshpass -y`

## Limitations
The bash script only runs one command with sudo.  Any further commands separated with a semicolon or && do not get the sudo permissions.

This could be worked around by splitting the command on semicolon and do a for loop on the resultant commands.

The PoshSSH script does not have this same limitation.
  
## Testing results
<pre>amko@y0319t11229:~$ ./remoteSudo.sh amko 'ls /etc/audit' ./hosts
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

## Inspired by 
PowerShell Posh-SSH
(also included in the repo)
