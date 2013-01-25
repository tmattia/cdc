module CDC
  class Response
    def initialize(status, headers, schema)
      @status = status
      @headers = headers
      @schema = schema
    end

    def matches?(response)
      @status == response.status && @headers == response.headers && @schema.validate(response.body)
    end
  end
end
