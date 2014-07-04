#
# Cookbook Name:: cpanm
# Recipe:: default
#
# Copyright 2014, Xiang Li
#
# All rights reserved - Do Not Redistribute
#
bash "install-cpanm" do
	code <<-EOH
		curl -L http://cpanmin.us | perl - --sudo App::cpanminus
	EOH
	action :nothing
end
