module Printful
  class FilesResource < Resource

    def retrieve(id:)
      response = get_request("files/#{id}")
      File.new(response.body["result"])
    end

    def create(**params)
      response = post_request("files", body: params)
      File.new(response.body["result"])
    end

  end
end
