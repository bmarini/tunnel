require "ostruct"

module Tunnel
  class Config < OpenStruct

    def to_yaml(opts={})
      @table.to_yaml(opts)
    end

    def to_s
      "[ %s ] %s:%s -> 0.0.0.0:%s" %
      [ name, remote_host, remote_port, local_port ]
    end

    def ssh_command
      "ssh -v -p %s -nNT -g -R *:%s:0.0.0.0:%s %s@%s" %
      [ ssh_port, remote_port, local_port, remote_user, remote_host ]
    end
  end
end