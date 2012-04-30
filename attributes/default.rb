default['logstash']['directory'] = '/opt/logstash'
default['logstash']['server_role'] = 'logstash-server'
default['logstash']['broker_role'] = 'logstash-broker'
default['logstash']['remote_broker_ip'] = nil
default['logstash']['index_role'] = 'logstash-index'
default['logstash']['url'] = 'http://semicomplete.com/files/logstash/logstash-1.1.0-monolithic.jar'
default['logstash']['version'] = '1.1.0'
default['logstash']['checksum'] = '6c9f491865b5eed569e029f6ad9f3343f346cfa04d04314e7aadea7b9578490f'

default['logstash']['grok']['url'] = 'http://semicomplete.googlecode.com/files/grok_'
default['logstash']['grok']['version'] = '1.20101030.3088_amd64'
default['logstash']['grok']['checksum'] = 'd37c8604890268574d8f3dbe2324e539a61f075ea8c099a697c3caba376a2b99'

default['logstash']['syslog_server'] = false
default['logstash']['syslog']['debug'] = false
default['logstash']['syslog']['listen'] = '0.0.0.0'
default['logstash']['syslog']['message_format'] = 'json'
default['logstash']['syslog']['port'] = 514
default['logstash']['syslog']['type'] = 'syslog'