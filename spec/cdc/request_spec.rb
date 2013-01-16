module Cdc
  describe Request do
    describe '#execute' do
      let(:path) { '/foo' }
      let(:headers) { {'Accept' => 'application/json'} }
      let(:params) { {'foo' => 'bar'} }
      let(:connection) { mock('connection') }
      let(:fake_response) { stub('response') }

      it 'should make a GET request' do
        connection.should_receive(:get).with(path, params, headers).and_return(fake_response)
        response = described_class.new(:get, path, headers, params).execute(connection)
        response.should == fake_response
      end

      it 'should make a POST request' do
        connection.should_receive(:post).with(path, params, headers).and_return(fake_response)
        response = described_class.new(:post, path, headers, params).execute(connection)
        response.should == fake_response
      end
    end
  end
end
