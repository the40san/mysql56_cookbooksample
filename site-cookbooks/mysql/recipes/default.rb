#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mysql_service 'foo' do
  port '3306'
  version '5.6'
  initial_root_password ''
  action [:create, :start]
end

template '/etc/my.cnf' do
  source 'my.erb'
  owner  'mysql'
  group  'mysql'
  mode   0755
  notifies :restart, 'mysql_service[foo]'
  action :create
end
