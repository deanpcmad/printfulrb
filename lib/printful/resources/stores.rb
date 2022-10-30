module Printful
  class StoresResource < Resource

    def list
      response = get_request("stores")
      body = response.body["result"]
      Collection.from_response(body: body, type: Store)
    end

    def retrieve(id:)
      response = get_request("stores/#{id}")
      Store.new(response.body["result"])
    end

  end
end
