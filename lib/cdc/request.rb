module Cdc
  class Request
    def initialize(method, path, headers, params)
      @method = method
      @path = path
      @headers = headers
      @params = params
    end

    def execute
      service.send(@method, @path, @params, @headers)
    end
  end
end
