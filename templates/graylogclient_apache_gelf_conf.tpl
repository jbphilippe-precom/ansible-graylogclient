GelfEnabled On
GelfUrl "udp://{{ graylogclient_graylog_server_addr }}:{{ graylogclient_graylog_server_port }}"
GelfSource "{{ ansible_hostname }}"
GelfFacility "apache-gelf"
GelfTag "Apache-log"
GelfFields "ABDhmsvRti"
