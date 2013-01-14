module Cdc
  describe Contract do
    let(:request) { mock('request') }
    let(:schema) { mock('schema') }

    subject { Contract.new(request, schema) }

    describe '#valid?' do
      let(:response) { stub('response') }

      before { request.should_receive(:execute).and_return(response) }

      context 'when request response matches schema' do
        before { schema.should_receive(:validate).with(response).and_return(true) }

        it { should be_valid }
      end

      context 'when request response does not match schema' do
        before { schema.should_receive(:validate).with(response).and_return(false) }

        it { should_not be_valid }
      end
    end
  end
end
