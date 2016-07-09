#
# Cookbook Name:: snmpd
# Recipe:: tomcat
#
# Copyright 2013, bageljp
#
# All rights reserved - Do Not Redistribute
#

include_recipe "snmpd::default"

template "/etc/snmp/tomcat.acl" do
  owner "#{node['tomcat']['user']}"
  group "#{node['tomcat']['group']}"
  mode 00600
end
