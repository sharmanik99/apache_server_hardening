#
# Cookbook:: apache_server_hardening
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'apache2::default'

file '/etc/httpd/conf/httpd.conf' do
  action :delete
  only_if { File.exist? '/etc/httpd/conf/httpd.conf'}
end

cookbook_file '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf'
  owner 'apache'
  group 'apache'
  mode '0640'
  action :create
end

file '/usr/share/man/man8/apachectl.8.gz' do
  action :delete
end