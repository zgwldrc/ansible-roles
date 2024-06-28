# ref
# https://docs.ansible.com/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html
plugin: amazon.aws.aws_ec2
cache: yes
cache_plugin: ansible.builtin.jsonfile
cache_timeout: 60
cache_connection: /tmp/aws_inventory
cache_prefix: aws_ec2

boto_profile: <your aws profile name> # aws profile has ec2 readonly permission
regions:
  - ap-southeast-1
# all filters are listed at following url
# http://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html#options
filters:
  instance-state-name: running
  # tag:jenkins: 1
# keyed_groups:
  # - key: placement.region
  #   prefix: ""
  #   separator: "" 
  # - key: tags['aws:eks:cluster-name']
  #   prefix: ""
  #   separator: ""
  # - key: tags['alpha.eksctl.io/nodegroup-type']
  #   prefix: ""
  #   separator: ""
  # - key: tags['Name']
  #   prefix: ""
  #   separator: ""

# show hostnames in exp, exp can ref ec2 instance filter from
# https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#EC2.Client.describe_instances
hostnames:
  - tag:Name
  # - tag:Name=Tag1,Name=Tag2  # Return specific hosts only
  # - tag:CustomDNSName
  # - dns-name
  # - name: 'tag:Name=Tag1,Name=Tag2'
  # - ip-address
  # - 'private-ip-address'
    # separator: '_'
    # prefix: 'tag:Name'
compose:
  # create vars from j2 exp, exp can ref ec2 attrs from
  # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#instance
  # use a private address where a public one isn't assigned
  # ansible_host: public_ip_address | default(private_ip_address)
  # id: tags['id']
  # dns: tags['dns']
  # alternatively, set the ansible_host variable to connect with the private IP address without changing the hostname
  ansible_host: private_ip_address