{% if log_file %}
# This value is used as a prefix for the log file name
log_file = "{{log_file}}"
{% endif %}

{% if log_rotate_bytes %}
log_rotate_bytes = {{log_rotate_bytes}}
{% endif %}

{% if log_rotate_duration %}
log_rotate_duration = "{{log_rotate_duration}}"
{% endif %}

{% if log_rotate_max_files %}
log_rotate_max_files = {{log_rotate_max_files}}
{% endif %}

{% if log_level %}
log_level = "{{log_level|lower}}"
{% endif %}

{% if log_json %}
log_json = {{log_json|lower}}
{% endif %}

{% if enable_syslog %}
enable_syslog = {{enable_syslog|lower}}
{% endif %}

{% if syslog_facility %}
# When enable_syslog is provided, 
# this controls to which facility messages are sent. By default, LOCAL0 will be used.
syslog_facility = "{{syslog_facility}}"
{% endif %}