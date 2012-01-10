# Author:: Anthony Goddard
# Author:: Phil Cryer
#
# Cookbook Name:: logstash
# Recipe:: default
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


directory node['logstash']['directory'] do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

remote_file "#{node['logstash']['directory']}/logstash-#{node['logstash']['version']}-monolithic.jar" do
  source "http://semicomplete.com/files/logstash/logstash-#{node['logstash']['version']}-monolithic.jar"
  mode "0744"
  checksum node['logstash']['checksum']
end

directory '/etc/logstash' do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end
