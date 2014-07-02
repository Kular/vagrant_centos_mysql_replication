# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.omnibus.chef_version = :latest
  config.vm.box = "centos65"
  config.vm.box_url = "~/Document/Vagrant\ Box/WS-CentOS.box"


  config.vm.define :db_master do |vm_config|
    vm_config.vm.host_name = "vm-master"
    vm_config.vm.network "private_network", ip: "192.168.88.11"
    vm_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.roles_path = "roles"
      chef.add_role("master");
      chef.run_list = [
        'yum',
        'yum-mysql-community::connectors',
        'mysql::server',
        'mysql::client'
      ]
      chef.json = {
        mysql: {
          version: "5.1",
          server_root_password: "",
          server_repl_password: "rakuraku",
          max_allowed_packet: "16M",
          log_bin: "mysql-bin",
          server_id: "1",
          sync_binlog: "1",
          innodb_flush_log_at_trx_commit: "1"
        }
      }
    end
  end

  config.vm.define :db_slave do |vm_config|
    vm_config.vm.host_name = "vm-slave"
    vm_config.vm.network "private_network", ip: "192.168.88.12"
    vm_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.roles_path = "roles"
      chef.add_role("slave");
      chef.run_list = [
        'yum',
        'yum-mysql-community::connectors',
        'mysql::server',
        'mysql::client'
      ]
      chef.json = {
        mysql: {
          version: '5.1',
          server_root_password: "",
          server_id: '2'
        }
      }
    end
  end

end

