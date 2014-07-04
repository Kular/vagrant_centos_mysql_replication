#
# Cookbook Name:: Apache
# Recipe:: default
#
# Copyright 2014, Xiang Li
#
# All rights reserved - Do Not Redistribute
#

# Apache2
package "httpd" do
	action :install
end

# Apacheを起動
service "httpd" do
    action [:start, :enable]
end

bash "chkconfig" do
	code "chkconfig httpd on"
end