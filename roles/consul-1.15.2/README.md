Consul
======

A brief description of the role goes here.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

host_vars/h1.yml

```yaml
agent_role: ["ca","server"]
```

host_vars/h2.yml

```yaml
agent_role: ["server"]
```

host_vars/h3.yml

```yaml
agent_role: ["server"]
```

deploy.yml

```yaml
- hosts: consul_cluster
  remote_user: ec2-user
  become: true
  roles:
  - role: consul-1.15.1
    user: java_app
    group: appgroup
  
```

ops.sh

```bash
#!/bin/bash
alias ap='ansible-playbook'
pb='your/playbook/path'
keyfile='~/.ssh/id_rsa
inventory='your inventory file path'
export ANSIBLE_ROLES_PATH="your roles path"
# install
ap -K -i $inventory --key-file $keyfile $pb
ap -K -i $inventory --key-file $keyfile $pb -e bootstrap=true
# uninstall
ap -K -i $inventory --key-file $keyfile $pb -e uninstall=true

```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
