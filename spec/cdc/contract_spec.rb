module Cdc
  describe Contract do
    let(:request) { mock('request') }
    let(:expected_response) { mock('expected_response') }

    subject { Contract.new(request, expected_response) }

    describe '#valid?' do
      let(:actual_response) { stub('actual_response') }

      before { request.should_receive(:execute).and_return(actual_response) }

      context 'when the actual response matches the expected response' do
        before { expected_response.should_receive(:matches?).with(actual_response).and_return(true) }

        it { should be_valid }
      end

      context 'when the actual response does not match the expected response' do
        before { expected_response.should_receive(:matches?).with(actual_response).and_return(false) }

        it { should_not be_valid }
      end
    end
  end
end
