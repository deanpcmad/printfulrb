module Printful
  class Client
    attr_reader :access_token, :adapter

    def initialize(access_token:, adapter: Faraday.default_adapter, stubs: nil)
      @access_token = access_token
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def catalog
      CatalogResource.new(self)
    end

    def stores
      StoresResource.new(self)
    end

    def connection
      url = "https://api.printful.com"

      @connection ||= Faraday.new(url) do |conn|
        conn.request :authorization, :Bearer, access_token
        conn.request :json

        conn.response :json

        conn.adapter adapter, @stubs
      end
    end

  end
end
