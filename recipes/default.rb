#
# Cookbook Name:: chef-pdns
# Recipe:: default
#
# Copyright (C) 2014 SiruS (https://github.com/podwhitehawk)
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

if platform_family?("rhel")
  include_recipe "yum-epel"
elsif platform_family?("debian")
  include_recipe "apt"
end

package "pdns" do
  package_name value_for_platform_family(
    "debian" => "pdns-server",
    "rhel" => "pdns"
  )
end

if node["chef-pdns"]["mysql_backend"]["enable"]
  include_recipe "chef-pdns::mysql-backend"
else
  template "#{node["chef-pdns"]["server"]["config-dir"]}/pdns.conf" do
	  source "pdns.conf.erb"
	  owner node["chef-pdns"]["server"]["setuid"]
	  group node["chef-pdns"]["server"]["setgid"]
	  mode 0640
	end
end

service "pdns" do
  action [:enable, :start]
end
