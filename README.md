Role Name
=========

  This role is used to deploy configuration for sending middlewares logs into a remote syslog like graylog

Requirements
------------

  Ansible 2.1 is required

Role Variables
--------------

    ## Base ##
      graylogclient_graylog_server_addr : "to modify" (Mandatory)
      graylogclient_graylog_server_port: "to modify" (Mandatory)
      graylogclient_protocol: "udp"


    ## Redis ##
      graylogclient_redis_rsyslog: no                                                           ## to deploy rsyslog configuration
      graylogclient_redis_nxlog: no                                                             ## to deploy nxlog configuration
      graylogclient_redis_std_rsyslog_conf: "graylogclient_redis_std_rsyslog_conf.tpl"          ## template rsyslog standalone
      graylogclient_redis_ms_rsyslog_conf: "graylogclient_redis_ms_rsyslog_conf.tpl"            ## template rsyslog master slave
      graylogclient_redis_cluster_rsyslog_conf: "graylogclient_redis_cluster_rsyslog_conf.tpl"  ## template rsyslog cluster
      graylogclient_redis_std_nxlog_conf: "graylogclient_redis_std_nxlog_conf.tpl"              ## template nxlog standalone
      graylogclient_redis_ms_nxlog_conf: "graylogclient_redis_ms_nxlog_conf.tpl"                ## template nxlog master slave
      graylogclient_redis_cluster_nxlog_conf: "graylogclient_redis_cluster_nxlog_conf.tpl"      ## template nxlog cluster
      graylogclient_redis_conf_name: "redis"                                                    ## rsyslog/nxlog config name
      graylogclient_redis_localname: "local0"                                                   ## rsyslog localname
      graylogclient_graylogseverity: "info"                                                     ## rsyslog severity
      ## variable non prefixees par "graylogclient_" pour faciliter l'utilisation conjointe avec le role ansible-redis
      redis_std: no                                                                             ## deploy configuration for redis standalone
      redis_cluster: no                                                                         ## deploy configuration for redis cluster
      redis_ms: no                                                                              ## deploy configuration for redis master slave
      redis_port: 6379                                                                          ## redis port
      redis_sentinel_port: 26379                                                                ## redis sentinel port
      redis_master_port: 6379                                                                   ## redis master port
      redis_slave_port: 6380                                                                    ## redis slave port

    # Cassandra
      graylogclient_cassandra_configuration_path: "/etc/cassandra/logback.xml"
      graylogclient_cassandra_libraries_path: "/usr/share/cassandra/lib/"

    # Elasticsearch
      graylogclient_elasticsearch_localname: "local0"
      # < 5.X
      graylogclient_elasticsearch_old_configuration_path: "/etc/elasticsearch/logging.yml"
      # > 5.X
      graylogclient_elasticsearch_configuration_path: "/etc/elasticsearch/log4j2.properties"
      graylogclient_elasticsearch_clustername: "elasticsearch"
      graylogclient_elasticsearch_libraries_path: "/usr/share/elasticsearch/lib/"
      graylogclient_elasticsearch_syslog: no
      graylogclient_elasticsearch_gelf: no
      graylogclient_elasticsearch_nxlog: no

    # Apache
      graylogclient_apache_plateforme: ""   ## ie: integration / preproduction / production
      graylogclient_apache_servername: ""   ## vhost server name

    # Nginx
      graylogclient_nginx_conf: "/etc/nginx/nginx.conf"
      graylogclient_nginx_plateforme: ""   ## ie: integration / preproduction / production

    # Karaf
      graylogclient_karaf_gelf_path: "/opt/karaf/system/org/ops4j/logging/gelfj"
      graylogclient_karaf_gelf_module_name: "gelfj-0.9.1-SNAPSHOT.jar"
      graylogclient_karaf_gelf_module_version: "0.9.1-SNAPSHOT"
      graylogclient_karaf_log4j_config_file: "/opt/karaf/etc/org.ops4j.pax.logging.cfg"
      graylogclient_karaf_startup_config_file: "/opt/karaf/etc/startup.properties"


Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Node.js Playbook
---------------------------

    ## STANDALONE ##
    - hosts: trusty
      become: yes
      roles:
        - { role: ansible-graylogclient }
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_middleware_list:
          - nodejs

Example Nginx Playbook
---------------------------

    ## STANDALONE ##
    - hosts: trusty
      become: yes
      roles:
        - { role: ansible-graylogclient }
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_middleware_list:
          - nginx

Example Activemq Playbook
---------------------------

    ## STANDALONE ##
    - hosts: trusty
      become: yes
      roles:
        - { role: ansible-graylogclient }
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_middleware_list:
          - activemq

Example karaf Playbook
---------------------------

    ## STANDALONE ##
    - hosts: trusty
      become: yes
      roles:
        - { role: ansible-graylogclient }
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_middleware_list:
          - karaf

Example MongoDB Playbook
---------------------------

    ## STANDALONE ##
    - hosts: trusty
      become: yes
      roles:
        - { role: ansible-graylogclient }
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_middleware_list:
          - mongodb

Example Redis Playbook
---------------------------

    ## STANDALONE ##
    - hosts: trusty
      become: yes
      roles:
        - { role: ansible-graylogclient }
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_redis_nxlog: yes
        redis_std: yes
        graylogclient_middleware_list:
          - redis

Example Redis Master / Slave Playbook
---------------------------

    ## STANDALONE ##
    - hosts: trusty
      become: yes
      roles:
        - { role: ansible-graylogclient }
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_redis_nxlog: yes
        redis_ms: yes
        graylogclient_middleware_list:
          - redis


Example Redis Cluster Playbook
---------------------------

    ## STANDALONE ##
    - hosts: trusty
      become: yes
      roles:
        - { role: ansible-graylogclient }
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_redis_nxlog: yes
        redis_cluster: yes
        graylogclient_middleware_list:
          - redis

Example ElasticSearch Playbook
---------------------------
:warning: Attention, l'ajout de logging que cela soit en *gelf* ou *syslog* sur
ElasticSearch provoque un arrêt/relance d'Elasticsearch. S'assurer avant de le
lancer que ES dispose de Replica et que les clients, en cas d'indisponibilité
du serveur, soit capable d'interroger les autres noeuds. :warning:

    ## STANDALONE ##
    - hosts: trusty
      become: yes
      roles:
        - { role: ansible-graylogclient }
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "12201"
        graylogclient_elasticsearch_syslog: no
        graylogclient_elasticsearch_nxlog: no
        graylogclient_elasticsearch_gelf: yes
        graylogclient_middleware_list:
          - elasticsearch

Example ElasticSearch Nxlog Playbook
---------------------------
    - hosts: trusty
      become: yes
      roles:
        - { role: ansible-graylogclient }
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_elasticsearch_syslog: no
        graylogclient_elasticsearch_gelf: no
        graylogclient_elasticsearch_nxlog: yes
        graylogclient_middleware_list:
          - elasticsearch

Example Cassandra GELF Playbook
---------------------------
    - hosts: Graylogclients
      become: yes
      gather_facts: True
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_protocol: "udp"
        graylogclient_middleware_list:
          - cassandra_gelf

Example Apache Nxlog Playbook
---------------------------
    - hosts: Graylogclients
      become: yes
      gather_facts: True
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_protocol: "udp"
        graylogclient_middleware_list:
          - apache_nxlog
        graylogclient_apache_servername: "testapachegraylgo"
        graylogclient_apache_plateforme: "lab"

Example Apache GELF Playbook
---------------------------
    - hosts: Graylogclients
      become: yes
      gather_facts: True
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_protocol: "udp"
        graylogclient_middleware_list:
          - apache_gelf

Example Apache Syslog Playbook
---------------------------
    - hosts: Graylogclients
      become: yes
      gather_facts: True
      vars:
        graylogclient_graylog_server_addr: "jlsmongo01l.btsys.local"
        graylogclient_graylog_server_port: "514"
        graylogclient_protocol: "udp"
        graylogclient_middleware_list:
          - apache_syslog
        graylogclient_apache_servername: "testapachegraylog"
        graylogclient_apache_plateforme: "lab"


License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
