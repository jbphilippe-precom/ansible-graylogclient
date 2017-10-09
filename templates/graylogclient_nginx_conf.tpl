log_format  graylog2_format '$remote_addr - $host [$time_local] "$request" $status $body_bytes_sent "$http_user_agent" $request_time application=nginx-$nginx_version plateform={{ graylogclient_nginx_plateforme }}';
access_log /var/log/nginx/access.log graylog2_format;
