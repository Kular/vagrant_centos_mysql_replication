#
# Cookbook Name:: mod_fastcgi
# Recipe:: default
#
# Copyright 2014, Xiang Li
#
# All rights reserved - Do Not Redistribute
#
require 'digest/sha2'


filename = "mod_fastcgi-current.tar.gz"
download_dir = "/tmp"
remote_uri = "http://www.fastcgi.com/dist/mod_fastcgi-current.tar.gz"
file_checksum = Digest::SHA256.digest(filename)
folder_name = node['mod_fastcgi']['folder_name']

remote_file "#{download_dir}/#{filename}" do
	source "#{remote_uri}"
	checksum "#{file_checksum}"
end


bash "install mod_fastcgi" do
	user "root"
	code <<-EOH
		cd #{download_dir}
		tar -zxvf #{filename}
		cd #{folder_name}/
		cp Makefile.AP2 Makefile
		make top_dir=/usr/lib/httpd
		make install top_dir=/usr/lib/httpd
	EOH
end

template "mod_fastcgi.conf" do
	path "/etc/httpd/conf.d/mod_fastcgi.conf"
	source "mod_fastcgi.conf.erb"
	owner "root"
	group "root"
	mode 0644
end


service "httpd" do
	action [:restart]
end
