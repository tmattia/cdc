module Cdc
  describe Contract do

    describe '#valid?' do
      let(:request) { mock('request') }
      let(:response) { mock('response') }
      let(:fake_response) { stub('fake_response') }

      it 'should execute a request and check if the response matches the contract definition' do
        request.should_receive(:execute).and_return(fake_response)
        response.should_receive(:matches?).with(fake_response).and_return(true)
        contract = Contract.new(request, response)
        contract.should be_valid
      end
    end
  end
end
