Vagrant.configure("2") do |config|
  # feed the monster
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  # using ubuntu host
  config.vm.box = "ubuntu/trusty64"

  # use rsync to keep host in sync with guest VM
  config.vm.synced_folder "app/", "/app", type: "rsync",
    rsync__exclude: ".git/",
    rsync__exclude: "node_modules/"

  # provision with docker and docker-compose
  config.vm.provision :docker
  # when running docker compose always rebuild and run
  config.vm.provision :docker_compose,
    yml: "/sync/docker-compose.yml",
    rebuild: true,
    run: "always"

  # don't automatically start syncing,
  # we'll kick that off in the startup script
  config.gatling.rsync_on_startup = false

  # forward ports
  config.vm.network :forwarded_port, guest: 3000, host: 3000 # service
end