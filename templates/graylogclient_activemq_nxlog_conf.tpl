########################################
# Modules                              #
########################################

<Extension syslog>
 Module xm_syslog
</Extension>

########################################
# Inputs                               #
########################################

<Input activemq>
 Module im_file
 File '/var/log/activemq/*.log'
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

<Route activemq>
    Path        activemq => out_syslog
</Route>
