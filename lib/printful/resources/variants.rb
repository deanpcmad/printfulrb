module Printful
  class VariantsResource < Resource

    def create(id:, **params)
      # attributes = {sync_product: product, sync_variants: variants}
      response = post_request("store/products/#{id}/variants", body: params)
      Variant.new(response.body["result"])
    end

    def retrieve(id:)
      response = get_request("store/variants/#{id}")
      Variant.new(response.body["result"])
    end

    def update(id:, **params)
      response = put_request("store/variants/#{id}", body: params)
      return true if response.success?
    end

    def delete(id:)
      response = delete_request("store/variants/#{id}")
      return true if response.success?
    end

  end
end
