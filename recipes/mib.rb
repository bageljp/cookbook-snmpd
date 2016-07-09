#
# Cookbook Name:: snmpd
# Recipe:: mib
#
# Copyright 2013, bageljp
#
# All rights reserved - Do Not Redistribute
#

%w(
  /root/.snmp
  /root/.snmp/mibs
).each do |d|
  directory "#{d}" do
    owner "root"
    group "root"
    mode 00755
  end
end

template "/root/.snmp/snmp.conf" do
  owner "root"
  group "root"
  mode 00644
end

Chef::Config[:cookbook_path].each{|elem|
  if File.exists?("/snmpd/templates/default/mibs")
    mibs_dir = File.join(elem, "/snmpd/templates/default/mibs")
    Dir.chdir mibs_dir
    mibs = Dir::glob("**/*")

    mibs.each do |t|
      if File::ftype("#{mibs_dir}/#{t}") == "file"
        template "/root/.snmp/mibs/#{t}" do
          owner "root"
          group "root"
          mode 00644
          source "mibs/#{t}"
        end
      else
        directory "/root/.snmp/mibs/#{t}" do
          owner "root"
          group "root"
          mode 00755
        end
      end
    end
  end
}
end

