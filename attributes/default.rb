default['logstash']['directory'] = '/opt/logstash'
default['logstash']['server_role'] = 'logstash-server'
default['logstash']['broker_role'] = 'logstash-broker'
default['logstash']['index_role'] = 'logstash-index'
default['logstash']['url'] = 'http://semicomplete.com/files/logstash/logstash-1.0.17-monolithic.jar'
default['logstash']['version'] = '1.0.17'
default['logstash']['checksum'] = 'caba048cb1ab3cc608d4569246f8b7effbb8272865c7864a662566c30517316c'

default['logstash']['grok']['url'] = 'http://semicomplete.googlecode.com/files/grok_'
default['logstash']['grok']['version'] = '1.20101030.3088_amd64'
default['logstash']['grok']['checksum'] = 'd37c8604890268574d8f3dbe2324e539a61f075ea8c099a697c3caba376a2b99'

default['logstash']['syslog_server'] = false
default['logstash']['syslog']['debug'] = false
default['logstash']['syslog']['listen'] = '0.0.0.0'
default['logstash']['syslog']['message_format'] = 'json'
default['logstash']['syslog']['port'] = 514
default['logstash']['syslog']['type'] = 'syslog'