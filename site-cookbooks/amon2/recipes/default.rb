#
# Cookbook Name:: amon2
# Recipe:: default
#
# Copyright 2014, Xiang Li
#
# All rights reserved - Do Not Redistribute
#

bash "touch-cpanfile" do
	code <<-EOH
		cd /tmp
		touch cpanfile
	EOH
	action :nothing
end

template "cpanfile" do
	path "/tmp/cpanfile"
	source "cpanfile.erb"
	owner "root"
	group "root"
	mode 0755
	variables(
     :version => node['amon2']['version']
	)
end

bash "install-amon2" do
	code <<-EOH
		cd /tmp
		cpanm --installdeps .
	EOH
	not_if { File.exist?("/usr/local/bin/amon2-setup.pl") }
end
