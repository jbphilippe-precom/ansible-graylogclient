########################################
# Modules                              #
########################################

<Extension syslog>
 Module xm_syslog
</Extension>

########################################
# Inputs                               #
########################################

<Input redis>
 Module im_file
 File '/var/log/redis/redis-server-{{ redis_port }}.log'
 SavePos TRUE
 ReadFromLast TRUE
 PollInterval 10
</Input>

<Input redis-sentinel>
 Module im_file
 File '/var/log/redis/redis-sentinel-{{ redis_sentinel_port }}.log'
 SavePos TRUE
 ReadFromLast TRUE
 PollInterval 10
</Input>

########################################
# Outputs                              #
########################################

<Output out_syslog>
 Module om_udp
 Host {{ graylogclient_graylog_server_addr }}
 Port {{ graylogclient_graylog_server_port }}
 Exec to_syslog_ietf();
</Output>

########################################
# Routes                               #
########################################

<Route redis>
    Path        redis => out_syslog
</Route>

<Route redis-sentinel>
    Path        redis-sentinel => out_syslog
</Route>
