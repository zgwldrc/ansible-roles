kafka 3.4.1
===========

scala 2.12 kafka 3.4.1 zookeeper 3.6.4

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

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- hosts: s234
  remote_user: david
  become: true
  roles:
  - role: zookeeper-3.7.1
    user: david
    group: david
    java_home: /usr/lib/jvm/java-11-openjdk-amd64

  - role: kafka_2.12-3.5.0
    user: david
    group: david
    java_home: /usr/lib/jvm/java-11-openjdk-amd64

- hosts: s2
  remote_user: david
  become: true
  roles:
  - role: kafka-exporter-1.7.0
    user: david
    group: david
    kafka_servers: "{{hostvars['s2']['ansible_default_ipv4']['address']}}:9092,{{hostvars['s3']['ansible_default_ipv4']['address']}}:9092,{{hostvars['s4']['ansible_default_ipv4']['address']}}:9092"
    kafka_version: 3.5.0
    java_home: /usr/lib/jvm/java-11-openjdk-amd64

  - role: kafka_2.12-3.5.0
    user: david
    group: david
    java_home: /usr/lib/jvm/java-11-openjdk-amd64

- hosts: s2
  remote_user: david
  become: true
  roles:
  - role: kafka-exporter-1.7.0
    user: david
    group: david
    kafka_servers: "{{hostvars['s2']['ansible_default_ipv4']['address']}}:9092,{{hostvars['s3']['ansible_default_ipv4']['address']}}:9092{{hostvars['s4']['ansible_default_ipv4']['address']}}:9092"
    kafka_version: 3.5.0
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
