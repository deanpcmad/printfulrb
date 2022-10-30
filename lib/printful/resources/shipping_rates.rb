module Printful
  class ShippingRatesResource < Resource

    def calculate(**params)
      response = post_request("shipping/rates", body: params)
      body = response.body["result"]
      Collection.from_response(body: body, type: ShippingRate)
    end

  end
end
