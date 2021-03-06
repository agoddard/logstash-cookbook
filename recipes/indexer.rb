# Author:: Anthony Goddard
# Author:: Phil Cryer
#
# Cookbook Name:: logstash
# Recipe:: indexer
#
#
# Copyright 2011, Woods Hole Marine Biologcal Laboratory
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'logstash::default'

gem_package 'jls-grok' do
  action :install
end

package 'libtokyocabinet8'
package 'libevent-1.4-2'

remote_file "/tmp/grok_#{node['logstash']['grok']['version']}.deb" do
  source "#{node['logstash']['grok']['url']}#{node['logstash']['grok']['version']}.deb"
  mode "0744"
  checksum node['logstash']['grok']['checksum']
end

dpkg_package "grok" do
  source "/tmp/grok_#{node['logstash']['grok']['version']}.deb"
  action :install
end


#find the broker(s) to recieve messages from
broker_host = []
if node['logstash']['remote_broker_ip']
  	  broker_host << node['logstash']['remote_broker_ip']
	  broker_port = node['logstash']['remote_broker_port'] if node['logstash']['remote_broker_port'] 
else
	search(:node, "role:#{node['logstash']['broker_role']} AND chef_environment:#{node.chef_environment}") do |n|
  	  broker_host << n['ipaddress']
	end
end

#find the index / elasticsearch node(s) to store messages in

index_host = []
search(:node, "role:#{node['logstash']['index_role']} AND chef_environment:#{node.chef_environment}") do |n|
  index_host << n['ipaddress']
end

graylog2_host = []
search(:node, "role:graylog2_server AND chef_environment:#{node.chef_environment}") do |n|
  graylog2_host << n['ipaddress']
end



template "/etc/init.d/logstash" do
  source "logstash.init.erb"
  mode "0755"
end


template "/etc/logstash/indexer.conf" do
  source "indexer.conf.erb"
  variables(
    :broker_host => broker_host,
    :broker_port => broker_port,
    :index_host => index_host,
    :graylog2_host => graylog2_host
  )
end

service "logstash" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end


