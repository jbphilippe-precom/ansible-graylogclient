########################################
# Modules                              #
########################################

<Extension syslog>
 Module xm_syslog
</Extension>

########################################
# Inputs                               #
########################################

<Input nodejs-out>
 Module im_file
 File '/var/log/node/*-out.log'
 Exec $Message = $raw_event; $Application = file_name();
 SavePos TRUE
 ReadFromLast TRUE
 PollInterval 10
</Input>

<Input nodejs-error>
 Module im_file
 File '/var/log/node/*-error.log'
 Exec $Message = $raw_event; $Application = file_name();
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

<Route nodejs-out>
    Path        nodejs-out => out_syslog
</Route>

<Route nodejs-error>
    Path        nodejs-error => out_syslog
</Route>
