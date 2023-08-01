#!/bin/bash
export PATH="{{java_home}}/bin:$PATH"
keytool -genkeypair -keystore {{ca_keystore_path}} \
    -alias {{ca_alias}} \
    -keyalg rsa -storepass "{{ca_storepass}}" -v -dname "CN={{ca_common_name}}" \
    -ext "SAN=IP:{{ansible_default_ipv4.address}},{% for dns_name in dns_names %}DNS:{{dns_name}}{% if not loop.last %},{% endif %}{% endfor %}" \
    -validity {{validity}}


