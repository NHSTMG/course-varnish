# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/yakkety64"
  config.vm.provision "file", source: ".git/logs/HEAD", destination: ".git_logs_HEAD"
  config.vm.provision :shell, path: "setup/bootstrap.sh"
  config.vm.provision :shell, path: "setup/always_run_on_vagrant_up.sh", run: "always"
  config.vm.synced_folder "shared", "/home/ubuntu/shared"
  config.vm.synced_folder "setup/bin", "/home/ubuntu/bin"
  config.vm.synced_folder "nginx/sites-enabled", "/etc/nginx/sites-enabled"

  config.vm.network "forwarded_port", guest: 80, host: 10080
  config.vm.network "forwarded_port", guest: 6081, host: 6081
  
  # Prevent TTY Errors
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

end
