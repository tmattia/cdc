module CDC
  describe Request do
    describe '#execute' do
      let(:path) { '/foo' }
      let(:headers) { {'Accept' => 'application/json'} }
      let(:params) { {'foo' => 'bar'} }
      let(:fake_response) { stub('response') }

      it 'should forward the request to a service' do
        request = described_class.new(:get, path, headers, params)
        request.stub(:service) do |service|
          service.should_receive(:get).with(path, params, headers).and_return(fake_response)
          request.execute.should == fake_response
        end
      end
    end

    describe '#service' do
      it 'should be injected' do
        request = described_class.new(nil, nil, nil, nil)
        request.should respond_to(:service)
      end
    end
  end
end
