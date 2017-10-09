########################################
# Modules                              #
########################################

<Extension syslog>
 Module xm_syslog
</Extension>

########################################
# Inputs                               #
########################################

<Input redis-master>
 Module im_file
 File '/var/log/redis/redis-server-{{ redis_master_port }}.log'
 SavePos TRUE
 ReadFromLast TRUE
 PollInterval 10
</Input>

<Input redis-slave>
 Module im_file
 File '/var/log/redis/redis-server-{{ redis_slave_port }}.log'
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

<Route redis-master>
    Path        redis-master => out_syslog
</Route>

<Route redis-slave>
    Path        redis-slave => out_syslog
</Route>
