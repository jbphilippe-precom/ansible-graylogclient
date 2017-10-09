local7.err    @{{ graylogclient_graylog_server_addr }}:514
$template ErrorLogByServerName,"/var/log/apache2/%%PROGRAMNAME%%-error.log"
local7.err ?ErrorLogByServerName
