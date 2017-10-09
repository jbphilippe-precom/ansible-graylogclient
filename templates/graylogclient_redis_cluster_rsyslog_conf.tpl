module(load="imfile" PollingInterval="10")

input(type="imfile"
         File="/var/log/redis/redis-server-{{ redis_master_port }}.log"
         Tag="redis-server-master"
         StateFile="redis-server-master.state"
         Severity="{{ graylogclient_graylogseverity }}"
         Facility="{{ graylogclient_redis_localname }}")

input(type="imfile"
         File="/var/log/redis/redis-server-{{ redis_slave_port }}.log"
         Tag="redis-server-slave"
         StateFile="redis-server-slave.state"
         Severity="{{ graylogclient_graylogseverity }}"
         Facility="{{ graylogclient_redis_localname }}")

{{ graylogclient_redis_localname }}.* action(type="omfwd"
                Target="{{ graylogclient_graylog_server_addr }}"
                Port="{{ graylogclient_graylog_server_port }}"
                Protocol="{{ graylogclient_protocol }}")
