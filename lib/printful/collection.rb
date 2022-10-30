module Printful
  class Collection
    attr_reader :data, :count

    def self.from_response(body:, type:)
      new(
        data: body.map { |attrs| type.new(attrs) },
        count: body.count
      )
    end

    def initialize(data:, count:)
      @data = data
      @count = count
    end
  end
end
