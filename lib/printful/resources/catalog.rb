module Printful
  class CatalogResource < Resource

    def products(category: nil)
      response = get_request("products?category_id=#{category}")
      body = response.body["result"]
      Collection.from_response(body: body, type: Product)
    end

    def categories
      response = get_request("categories")
      body = response.body["result"]["categories"]
      Collection.from_response(body: body, type: Category)
    end

    def variant(id:)
      response = get_request("products/variant/#{id}")
      Variant.new(response.body["result"]["variant"])
    end

    def product(id:)
      response = get_request("products/#{id}")
      Product.new(response.body["result"])
    end

    def product_sizes(id:)
      response = get_request("products/#{id}/sizes")
      ProductSize.new(response.body["result"])
    end

    def category(id:)
      response = get_request("categories/#{id}")
      Category.new(response.body["result"]["category"])
    end

  end
end
