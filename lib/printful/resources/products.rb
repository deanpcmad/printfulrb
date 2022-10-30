module Printful
  class ProductsResource < Resource

    def list
      response = get_request("store/products")
      body = response.body["result"]
      Collection.from_response(body: body, type: Product)
    end

    def create(product:, variants:)
      attributes = {sync_product: product, sync_variants: variants}
      response = post_request("store/products", body: attributes)
      Product.new(response.body["result"])
    end

    def retrieve(id:)
      response = get_request("store/products/#{id}")
      Product.new(response.body["result"])
    end

    def update(id:, product:, variants: nil)
      attributes = {sync_product: product, sync_variants: variants}
      response = put_request("store/products/#{id}", body: attributes)
      return true if response.success?
    end

    def delete(id:)
      response = delete_request("store/products/#{id}")
      return true if response.success?
    end

  end
end
