module CDC
  class Response
    def initialize(status, headers, schema)
      @status = status
      @headers = headers
      @schema = schema
    end

    def matches?(response)
      valid_status = @status == response.status
      valid_headers = @headers == response.headers.select { |key,_| @headers.include?(key) }
      valid_body = @schema.validate(response.body)
      valid_status && valid_headers && valid_body
    end
  end
end
