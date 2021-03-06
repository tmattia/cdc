module CDC
  class Schema
    include Dependo::Mixin

    def initialize(expectation)
      @expectation = expectation
    end

    def validate(data)
      schema_validator.validate(@expectation, data)
    end
  end
end
