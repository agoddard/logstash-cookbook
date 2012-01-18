# Author:: Anthony Goddard
# Author:: Phil Cryer
#
# Cookbook Name:: logstash
# Recipe:: web
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

#find the index / elasticsearch node(s) to store messages in

index_host = []
search(:node, "role:#{node['logstash']['index_role']} AND chef_environment:#{node.chef_environment}") do |n|
  index_host << n['ipaddress']
end


template "/etc/init.d/logstash-web" do
  source "logstash.init.erb"
  mode "0755"
  variables(
    :index_host => index_host.first, #for now, we only want the first one
    :mode => "web"
  )
end


service "logstash-web" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end


