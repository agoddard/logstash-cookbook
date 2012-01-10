default['logstash']['directory'] = '/opt/logstash'
default['logstash']['server_role'] = 'logstash_server'
default['logstash']['broker_role'] = 'logstash_broker'
default['logstash']['url'] = 'http://semicomplete.com/files/logstash/logstash-1.0.17-monolithic.jar'
default['logstash']['version'] = '1.0.17'
default['logstash']['checksum'] = 'caba048cb1ab3cc608d4569246f8b7effbb8272865c7864a662566c30517316c'

default['logstash']['syslog']['debug'] = false
default['logstash']['syslog']['listen'] = '0.0.0.0'
default['logstash']['syslog']['format'] = ""
default['logstash']['syslog']['message_format'] = 'json'
default['logstash']['syslog']['port'] = 514
default['logstash']['syslog']['tags'] = ""
default['logstash']['syslog']['type'] = 'syslog'