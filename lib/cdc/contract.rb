module CDC
  class Contract
    def initialize(request, response)
      @request = request
      @response = response
    end

    def valid?
      @response.matches?(@request.execute)
    end
  end
end
