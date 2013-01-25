module CDC
  describe Schema do
    describe '#validate' do
      let(:schema_validator) { stub('schema_validator') }
      let(:expectation) { stub('expectation') }
      let(:data) { stub('data') }

      it 'should delegate validation to a validator' do
        schema = described_class.new(expectation)
        schema.stub(:schema_validator => schema_validator)
        schema_validator.should_receive(:validate).with(expectation, data).and_return(true)
        schema.validate(data).should be_true
      end
    end

    describe '#schema_validator' do
      it 'should be injected' do
        schema = described_class.new(nil)
        schema.should respond_to(:schema_validator)
      end
    end
  end
end
