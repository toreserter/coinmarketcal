module Coinmarketcal
  class Category
    attr_reader :id, :name

    def initialize(attrs = {})
      @id = attrs['id']
      @name = attrs['name']
    end

    def self.all
      client.get('v1/categories').map{|data| new(data) }
    end

    private

    def self.client
      @client ||= Coinmarketcal.client
    end

  end
end
