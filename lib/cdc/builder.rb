module Cdc
  class Builder
    def self.from_file(path)
      contract = JSON.parse(File.read(path))
      request = parse_request(contract['request'])
      response = parse_response(contract['response'])
      Contract.new(request, response)
    end

    private
    def self.parse_request(request)
      Request.new(request['method'].downcase.to_sym,
                  request['path'],
                  request['headers'],
                  request['params'])
    end

    def self.parse_response(response)
      Response.new(response['status'], response['headers'], Schema.new(response['body']))
    end
  end
end
