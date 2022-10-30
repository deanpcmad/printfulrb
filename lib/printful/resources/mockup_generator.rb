module Printful
  class MockupGeneratorResource < Resource

    def printfiles(id:, **params)
      response = get_request("mockup-generator/printfiles/#{id}", params: params)
      MockupPrintfile.new(response.body["result"])
    end

    def templates(id:, **params)
      response = get_request("mockup-generator/templates/#{id}", params: params)
      MockupTemplate.new(response.body["result"])
    end

    def create(id:, **params)
      response = post_request("mockup-generator/create-task/#{id}", body: params)
      MockupTask.new(response.body["result"])
    end

    def retrieve(id:)
      response = get_request("mockup-generator/task?task_key=#{id}")
      MockupTask.new(response.body["result"])
    end

  end
end
