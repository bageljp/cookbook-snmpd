#
# Cookbook Name:: snmpd
# Recipe:: default
#
# Copyright 2013, bageljp
#
# All rights reserved - Do Not Redistribute
#

case node['platform_family']
when 'rhel'
  %w(net-snmp net-snmp-devel net-snmp-libs net-snmp-utils).each do |pkg|
    yum_package pkg do
      action :install
      arch "x86_64"
    end
  end

  template "/etc/snmp/snmpd.conf" do
    owner "root"
    group "root"
    mode 00644
    notifies :restart, 'service[snmpd]'
  end

  template "/etc/sysconfig/snmpd" do
    owner "root"
    group "root"
    mode 00644
    notifies :restart, 'service[snmpd]'
  end

  template "/etc/snmp/getmemfree.sh" do
    owner "root"
    group "root"
    mode 00755
  end

  template "/etc/snmp/nfs_client.sh" do
    owner "root"
    group "root"
    mode 00755
  end

  template "/etc/snmp/nfs_server.sh" do
    owner "root"
    group "root"
    mode 00755
  end

  service "snmpd" do
    action [ :enable, :start ]
  end

end

