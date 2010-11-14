require "highline"
require "yaml"

module Tunnel
  autoload :CLI, "tunnel/cli"
  autoload :Configfile, "tunnel/configfile"
  autoload :Config, "tunnel/config"

  def self.start(conf)
    puts "Starting #{conf}"
    puts "--> #{conf.ssh_command}"
    system conf.ssh_command
  end
end
