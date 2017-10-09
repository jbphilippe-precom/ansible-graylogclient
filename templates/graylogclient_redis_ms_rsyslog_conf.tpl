module(load="imfile" PollingInterval="10")

input(type="imfile"
         File="/var/log/redis/redis-server-{{ redis_port }}.log"
         Tag="redis-server"
         StateFile="redis-server.state"
         Severity="{{ graylogclient_graylogseverity }}"
         Facility="{{ graylogclient_redis_localname }}")

input(type="imfile"
         File="/var/log/redis/redis-sentinel-{{ redis_sentinel_port }}.log"
         Tag="redis-sentinel"
         StateFile="redis-sentinel.state"
         Severity="{{ graylogclient_graylogseverity }}"
         Facility="{{ graylogclient_redis_localname }}")

{{ graylogclient_redis_localname }}.* action(type="omfwd"
                Target="{{ graylogclient_graylog_server_addr }}"
                Port="{{ graylogclient_graylog_server_port }}"
                Protocol="{{ graylogclient_protocol }}")
