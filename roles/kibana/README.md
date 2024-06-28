# 安装过程
https://www.elastic.co/guide/en/kibana/7.17/targz.html


# Example
playbook
```yaml
- hosts: elasticsearch01
  remote_user: ubuntu
  become: true
  roles:
  - role: kibana
    version: 7.17.22
    user: app_user
    group: app_group
    elasticsearch_hosts: ["http://localhost:9200"]
    elasticsearch_username: kibana_system
    elasticsearch_password: ""
```

# Steps

```bash
playbook=""
ansible-playbook $playbook -e elasticsearch_password=""
# uninstall
ansible-playbook $playbook -e uninstall=true
```
