# Example

```yaml
- hosts: bk-test-ms-basenft-elasticsearch01
  remote_user: ec2-user
  become: true
  roles:
  - role: elasticsearch-7.10.2
    user: app_user
    group: app_group
    jvm_opt_xms: 8g
    jvm_opt_xmx: 8g
    node_roles: ["master"]
    cluster_name: "bk-test-ms-basenft-elasticsearch"
```

# Steps

```bash
playbook="playbooks/elasticsearch-demo/deploy.yml"
inventory="hosts.yaml"
# 发现 自举
ansible-playbook -i $inventory $playbook -K -e bootstrap=true
# 取消自举 并启用安全
ansible-playbook -i $inventory $playbook -K -e bootstrap=false -e xpack_security_enabled=true

# uninstall
ansible-playbook -i $inventory $playbook -K -e uninstall=true

```
