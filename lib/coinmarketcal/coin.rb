module Coinmarketcal
  class Coin
    attr_reader :id, :name, :symbol

    def initialize(attrs = {})
     @id = attrs['id']
     @name = attrs['name']
     @symbol = attrs['symbol']
   end

   def self.all
     client.get('v1/coins').map{|data| new(data) }
   end

   private

   def self.client
     @client ||= Coinmarketcal.client
   end

  end
end
