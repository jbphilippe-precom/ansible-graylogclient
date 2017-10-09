########################################
# Modules                              #
########################################

<Extension syslog>
 Module xm_syslog
</Extension>

########################################
# Inputs                               #
########################################

<Input nginx-access>
 Module im_file
 File '/var/log/nginx/*access*.log'
 SavePos TRUE
 ReadFromLast TRUE
 PollInterval 10
</Input>

<Input nginx-error>
 Module im_file
 File '/var/log/nginx/*error*.log'
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

<Route nginx-access>
    Path        nginx-access => out_syslog
</Route>

<Route nginx-error>
    Path        nginx-error => out_syslog
</Route>
