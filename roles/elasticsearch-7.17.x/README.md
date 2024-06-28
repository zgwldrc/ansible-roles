# 安装过程

适用于 ubuntu22.04
https://www.elastic.co/guide/en/elasticsearch/reference/7.17/deb.html


# Example

host_vars/elasticsearch01.yml
```yaml
node_roles: ['ca', 'master']
```

host_vars/elasticsearch02.yml
```yaml
node_roles: ['master']
```

host_vars/elasticsearch03.yml
```yaml
node_roles: ['master']
```

playbook
```yaml
- hosts: elasticsearch01,elasticsearch02,elasticsearch03
  remote_user: ec2-user
  become: true
  roles:
  - role: elasticsearch-7.17.22
    user: app_user
    group: app_group
    jvm_opt_xms: 8g
    jvm_opt_xmx: 8g
    cluster_name: "elasticsearch"
```

# Steps

```bash
playbook="playbooks/elasticsearch-demo/deploy.yml"
# 发现 自举
ansible-playbook $playbook -K -e bootstrap=true
# 取消自举 并启用安全
ansible-playbook $playbook -K -e xpack_security_enabled=true
# uninstall
ansible-playbook $playbook -K -e uninstall=true
```
