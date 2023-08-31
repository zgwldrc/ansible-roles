#!/bin/bash
export PATH="{{java_home}}/bin:$PATH"
keytool -genkeypair -keystore {{keystore_path}} -alias "{{keystore_alias}}" \
    -keyalg rsa -storepass "{{storepass}}" -v -dname "CN={{common_name}}" \
    -ext "SAN=IP:{{ansible_default_ipv4.address}},{% for dns_name in dns_names %}DNS:{{dns_name}}{% if not loop.last %},{% endif %}{% endfor %}" \
    -validity {{validity}}

keytool -keystore {{keystore_path}} -storepass "{{storepass}}" \
    -alias "{{keystore_alias}}" -certreq -file {{certreq_path}}
