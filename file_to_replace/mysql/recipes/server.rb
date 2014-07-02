#
# Cookbook Name:: mysql
# Recipe:: server
#
# Copyright 2008-2013, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

mysql_service node['mysql']['service_name'] do
  version node['mysql']['version']
  port node['mysql']['port']
  data_dir node['mysql']['data_dir']
  server_root_password node['mysql']['server_root_password']
  server_debian_password node['mysql']['server_debian_password']
  server_repl_password node['mysql']['server_repl_password']
  allow_remote_root node['mysql']['allow_remote_root']
  remove_anonymous_users node['mysql']['remove_anonymous_users']
  remove_test_database node['mysql']['remove_test_database']
  root_network_acl node['mysql']['root_network_acl']

  # default common settings
  character_set_server node['mysql']['character_set_server']
  default_character_set node['mysql']['default_character_set']
  innodb_buffer_pool_size node['mysql']['innodb_buffer_pool_size']

  # DB insertion
  max_allowed_packet node['mysql']['max_allowed_packet']
  
  # Replication 
  log_bin node['mysql']['log_bin']
  server_id node['mysql']['server_id']
  sync_binlog node['mysql']['sync_binlog']
  innodb_flush_log_at_trx_commit node['mysql']['innodb_flush_log_at_trx_commit']

  action :create
end
