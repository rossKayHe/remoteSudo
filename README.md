# remoteSudo

Alllows use of sudo commands on remote hosts

## Usage<br>
`   remoteSudo.sh <user> <password> <command> <host file||comma delimited list>`<br>

## Requirement
Requires sshpass
Install with<br>
`  yum install sshpass -y`

## Issue<br>
Unfortunately this puts your password in your .bash_history, but you can edit your .bash_history after the command.<br>
The command seems to write to history after the script exits so the script cannot remove it.<br>
You can clear your bash history with<br>
`history -c`<br>
Also you can replace your password in .bash_history with vi.<br>
`:%s/my_secret_password/myPassword/g`
  
## Testing results
<pre>amko@y0319t11229:~$ ./remoteSudo.sh amko *myPassword* 'ls /etc/audit' ./hosts
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
