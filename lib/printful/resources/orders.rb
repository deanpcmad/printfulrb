module Printful
  class OrdersResource < Resource

    def list
      response = get_request("orders")
      body = response.body["result"]
      Collection.from_response(body: body, type: Order)
    end

    def estimate(**params)
      response = post_request("orders/estimate-costs", body: params)
      Cost.new(response.body["result"])
    end

    def create(**params)
      # attributes = {sync_product: product, sync_variants: variants}
      response = post_request("orders", body: params)
      Order.new(response.body["result"])
    end

    def retrieve(id:)
      response = get_request("orders/#{id}")
      Order.new(response.body["result"])
    end

    def update(id:, **params)
      response = put_request("orders/#{id}", body: params)
      return true if response.success?
    end

    def cancel(id:)
      response = delete_request("orders/#{id}")
      return true if response.success?
    end

    def confirm(id:)
      response = post_request("orders/#{id}/confirm", body: {})
      Order.new(response.body["result"])
    end

  end
end
