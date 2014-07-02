#
default['mysql']['service_name'] = 'default'

# passwords
default['mysql']['server_root_password'] = 'ilikerandompasswords'
default['mysql']['server_debian_password'] = nil
default['mysql']['server_repl_password'] = nil

# used in grants.sql
default['mysql']['allow_remote_root'] = false
default['mysql']['remove_anonymous_users'] = true
default['mysql']['root_network_acl'] = nil

case node['platform']
when 'smartos'
  default['mysql']['data_dir'] = '/opt/local/lib/mysql'
else
  default['mysql']['data_dir'] = '/var/lib/mysql'
end

# port
default['mysql']['port'] = '3306'

# Set default character-set
default['mysql']['character_set_server'] = 'utf8'
default['mysql']['default_character_set'] = 'utf8'

# Set InnoDB pool size
default['mysql']['innodb_buffer_pool_size'] = '512M'
