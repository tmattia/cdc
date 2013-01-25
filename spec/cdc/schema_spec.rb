module Cdc
  describe Schema do
    describe '#validate' do
      let(:validator) { stub('validator') }
      let(:expectation) { stub('expectation') }
      let(:data) { stub('data') }

      it 'should delegate validation to a validator' do
        schema = described_class.new(expectation)
        schema.stub(:validator => validator)
        validator.should_receive(:validate).with(expectation, data).and_return(true)
        schema.validate(data).should be_true
      end
    end

    describe '#validator' do
      it 'should be injected' do
        schema = described_class.new(nil)
        schema.should respond_to(:validator)
      end
    end
  end
end
