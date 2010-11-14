module Tunnel
  class Configfile
    class << self

      def configs
        @configs ||= ( load_from_file || [] )
      end

      def load_from_file
        return false unless config_exists?

        if result = YAML.load_file(configfile)
          result.map { |c| Config.new(c) }
        else
          puts "Your tunnel config (~/.tunnel) is not valid yaml"
        end
      end

      def add(config)
        configs.push(config)
        save
      end

      def save
        File.open(configfile, "w+") do |f|
          f.puts YAML.dump( configs.sort_by { |c| c.name } )
        end
      end

      def config_exists?
        File.exist?(configfile)
      end

      def configfile
        File.expand_path("~/.tunnel")
      end
    end
  end
end
