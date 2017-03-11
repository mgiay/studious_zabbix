Guide
========

```
# git clone
# mkdir /etc/zabbix/scripts/
# cp -r libs/ openstack_services.py /etc/zabbix/scripts/
# chmod +x /etc/zabbix/scripts/openstack_services.py
```
Edit file /etc/zabbix/scripts/libs/.env
```
[default]
url = http://{IP}:35357
username = {USERNAME}
user_id = {USERID}
password = {PASSWORD}
project_id = {PROJECT_ID}
neutron_pattern = {NEUTRON_PATTERN}
```
