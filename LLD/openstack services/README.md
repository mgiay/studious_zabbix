Install
========

```
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
Testing
========
Example discovery nova controller hosts
```
# /etc/zabbix/scripts/openstack_services.py --project nova --discovery discovery_controller_hosts
// return json data
{
       "data":[
              {
                     "{#OPENSTACK_NOVA_CONTROLLER}":"controller03"
              },
              {
                     "{#OPENSTACK_NOVA_CONTROLLER}":"controller02"
              },
              {
                     "{#OPENSTACK_NOVA_CONTROLLER}":"controller01"
              }
       ]
}

```
Example check services up/down
```
# /etc/zabbix/scripts/openstack_services.py --project nova --service_state --host controller01 --service nova-scheduler
// return 1 (up), 0 (down)
1
```
