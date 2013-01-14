module Cdc
  class Contract
    def initialize(request, schema)
      @request = request
      @schema = schema
    end

    def valid?
      @schema.validate(@request.execute)
    end
  end
end
