require 'faraday'
require 'faraday_middleware'
require 'base64'
require 'json'

module Coinmarketcal
  class Client
    HOST = 'https://api.coinmarketcal.com'

    attr_reader :client_id, :client_secret, :access_token

    def initialize(attrs = {})
      @client_id = attrs[:client_id]
      @client_secret = attrs[:client_secret]
      @access_token = get_access_token
    end

    def get(path, params = {}, headers = {})
      response = connection.get do |req|
        url = "#{HOST}/#{path}"
        req.params.merge!(params)
        req.url(url)
        req.params[:access_token] = access_token
      end

      return_response(response)
    end

    private

    def connection
      @connection ||= Faraday.new(:url => HOST) do |faraday|
        faraday.request :json
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

    def return_response(response)
      if response.status.to_i == 200
        response.body
      else
        puts response.status
        #TODO: error handling
      end
    end

    def get_access_token
      response = connection.get do |req|
        url = "#{HOST}/oauth/v2/token"
        req.url(url)

        req.params[:client_id] = client_id
        req.params[:client_secret] = client_secret
        req.params[:grant_type] = 'client_credentials'
      end
      return_response(response)['access_token']
    end

  end
end
