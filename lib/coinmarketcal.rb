require "coinmarketcal/version"
require "coinmarketcal/exceptions"

module Coinmarketcal
  autoload :Client, 'coinmarketcal/client'
  autoload :Configuration, 'coinmarketcal/configuration'
  autoload :Coin, 'coinmarketcal/coin'
  autoload :Event, 'coinmarketcal/event'
  autoload :Category, 'coinmarketcal/category'


  def self.client
    @client ||= Client.new(configuration.auth)
  end

  def self.config
    yield configuration
    @client = Client.new(configuration.auth)
  end

  def self.configuration
    Configuration.instance
  end

  def self.root
    File.expand_path('../..', __FILE__)
  end
end
