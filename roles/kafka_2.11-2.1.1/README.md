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
- hosts: upex-security-kafkatest
  remote_user: ec2-user
  become: true
  roles:
  - role: kafka_2.11-2.1.1
    user: java_app
    group: appgroup
    java_home: /usr/local/jdk11
    kafka_heap_opts: "-Xmx2G -Xms2G"
    num_network_threads: 3
    num_io_threads: 8
    socket_send_buffer_bytes: 102400
    socket_receive_buffer_bytes: 102400
    socket_request_max_bytes: 104857600
    num_recovery_threads_per_data_dir: 1
    auto_create_topics_enable: true
    transaction_state_log_min_isr: 2
    log_retention_hours: 48
    log_retention_bytes: 0  
    useEmbededZk: true
    zk_heap_opts: "-Xmx256m -Xms256m"

- hosts: upex-security-kafkatest01
  remote_user: ec2-user
  become: true
  roles:
  - role: openjdk-17.0.1_linux-x64
    user: java_app
    group: appgroup
  - role: kafka-ui-0.7.0
    user: java_app
    group: appgroup
    kui_Xms: 256m
    kui_Xmx: 256m
    kui_Xmn: 256m
    kui_server_port: 8090
    # for template kui.yaml
    kui_cluster_name: "upex-security-kafkatest"
    kui_bootstrapServers: "172.31.249.82:9092,172.31.248.134:9092,172.31.249.165:9092"
  - role: kafka-exporter-1.7.0
    user: java_app
    group: appgroup
    kafka_servers: "172.31.249.82:9092,172.31.248.134:9092,172.31.249.165:9092"
    kafka_version: 2.1.1
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
