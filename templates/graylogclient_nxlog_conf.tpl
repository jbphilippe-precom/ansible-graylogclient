########################################
# Global directives                    #
########################################
User nxlog
Group nxlog

LogFile /var/log/nxlog/nxlog.log
LogLevel INFO

include /etc/nxlog/nxlog.d/*.conf
