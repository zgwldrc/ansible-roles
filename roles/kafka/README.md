kafka 2.4.1
===========

scala 2.12 kafka 3.4.1 zookeeper 3.6.4

Usage
-----

first step gen ca and server certs, this will fetch ca keystore to same directory with playbook

```
ansible-playbook site.yml -K -i inventory.yml
```

step two sign server cert with ca

```
ansible-playbook site.yml -e signcert=true
```

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- hosts: s2,s3,s4
  remote_user: david
  become: true
  roles:
  - role: openjdk-17.0.1_linux-x64
    user: david
    group: david
  
  - role: kafka
    scala_version: 2.13
    version: 3.5.1
    user: david
    group: david
    java_home: /usr/local/jdk/17.0.1


- hosts: s2
  remote_user: david
  become: true
  - role: kafka-exporter-1.7.0
    user: david
    group: david
    kafka_version: 3.5.1
    kafka_servers: "192.168.1.102:9092,192.168.1.103:9092,192.168.1.104:9092"
  - role: kafka-ui-0.7.0
    user: david
    group: david
    java_home: /usr/local/jdk/17.0.1
    kui_server_port: 8090
    kui_cluster_name: "s2,s3,s4"
    kui_bootstrapServers: "192.168.1.102:9092,192.168.1.103:9092,192.168.1.104:9092
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
