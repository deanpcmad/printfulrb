module Printful
  class Client
    attr_reader :access_token, :store_id, :adapter

    def initialize(access_token:, store_id: nil, adapter: Faraday.default_adapter, stubs: nil)
      @access_token = access_token
      @store_id = store_id
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

    def products
      ProductsResource.new(self)
    end

    def variants
      VariantsResource.new(self)
    end

    def product_templates
      ProductTemplatesResource.new(self)
    end

    def orders
      OrdersResource.new(self)
    end

    def files
      FilesResource.new(self)
    end

    def shipping_rates
      ShippingRatesResource.new(self)
    end

    def mockup_generator
      MockupGeneratorResource.new(self)
    end

    def connection
      url = "https://api.printful.com"

      @connection ||= Faraday.new(url) do |conn|
        conn.request :authorization, :Bearer, access_token
        conn.request :json

        if store_id
          conn.headers["X-PF-Store-Id"] = store_id
        end

        conn.response :json

        conn.adapter adapter, @stubs
      end
    end

  end
end
