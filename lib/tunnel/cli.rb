require "thor"

module Tunnel
  class CLI < Thor

    desc "start", "Start a tunnel"
    method_option :verbose, :type => :boolean, :aliases => "-v", :banner => "Enable verbose output"
    def start
      highline = HighLine.new
      highline.choose do |menu|
        menu.choices(*configs) do |choice|
          choice.verbose = options.verbose?
          Tunnel.start(choice)
        end
      end
    end

    desc "list", "List your tunnel configs"
    def list
      configs.each_with_index do |c, i|
        puts "#{i+1}. #{c}"
      end
    end

    desc "add", "Add a new tunnel config"
    def add
      highline = HighLine.new
      puts "Adding a new tunnel config"

      conf = Config.new
      conf.name        = highline.ask("Name:        ")
      conf.ssh_port    = highline.ask("SSH port:    ") { |q| q.default = "22" }
      conf.local_port  = highline.ask("Local port:  ") { |q| q.default = "3000" }
      conf.remote_user = highline.ask("Remote user: ") { |q| q.default = ENV['USER'] }
      conf.remote_host = highline.ask("Remote host: ")
      conf.remote_port = highline.ask("Remote port: ")

      Configfile.add(conf)
    end

    protected
    def configs
      @configs ||= begin
        c = Configfile.configs
        c.empty? ? abort("Please add a new config with `tunnel add`") : c
      end
    end
  end
end