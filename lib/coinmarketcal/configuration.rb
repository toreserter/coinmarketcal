require 'singleton'

module Coinmarketcal
  class Configuration
    include Singleton

    attr_accessor :client_id, :client_secret

    @@defaults = {
      client_id: ENV['coinmarketcal_client_id'],
      client_secret: ENV['coinmarketcal_client_secret']
    }

    def self.defaults
      @@defaults
    end

    def initialize
      reset
    end

    def auth
      {
        client_id: client_id,
        client_secret: client_secret
      }
    end

    def reset
      @@defaults.each_pair { |k, v| send("#{k}=", v) }
    end
  end
end
