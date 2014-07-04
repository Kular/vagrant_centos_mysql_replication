#
# Cookbook Name:: Apache
# Recipe:: default
#
# Copyright 2014, Xiang Li
#
# All rights reserved - Do Not Redistribute
#

# Apache2 
%w{httpd httpd-devel}.each do |pkg|
	package pkg do
		action :install
	end
end

# Apacheを起動 & 自動起動
service "httpd" do
    action [:start, :enable]
end