module Printful
  class ProductTemplatesResource < Resource

    def list
      response = get_request("product-templates")
      body = response.body["result"]["items"]
      Collection.from_response(body: body, type: ProductTemplate)
    end

    def retrieve(id:)
      response = get_request("product-templates/#{id}")
      ProductTemplate.new(response.body["result"])
    end

    def delete(id:)
      response = delete_request("product-templates/#{id}")
      return true if response.success?
    end

  end
end
