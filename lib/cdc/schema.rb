module Cdc
  class Schema
    include Dependo::Mixin

    def initialize(expectation)
      @expectation = expectation
    end

    def validate(data)
      validator.validate(@expectation, data)
    end
  end
end
