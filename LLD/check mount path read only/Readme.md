Description
============
This script checks for mount path that are read only. This will
be used in conjuction with the Zabbix monitoring and alerting system.

Installation
============
On Zabbix agent
1. Create `test_readonly` file in the directory path that are need check.
```bash
touch {path}/test_readonly
chown zabbix.zabbix {path}/test_readonly
```

2. In order to use this a Zabbix configuration fragment will have to be made.
It should look like this:
```bash
UserParameter=checkro[*],/etc/zabbix/scripts/checkro.sh $1
```