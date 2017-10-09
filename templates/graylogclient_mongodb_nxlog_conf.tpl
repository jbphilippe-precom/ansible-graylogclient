########################################
# Modules                              #
########################################

<Extension syslog>
 Module xm_syslog
</Extension>

########################################
# Inputs                               #
########################################

<Input mongodb>
 Module im_file
 File '/var/log/mongodb/mongod.log'
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

<Route mongo>
    Path        mongodb => out_syslog
</Route>
