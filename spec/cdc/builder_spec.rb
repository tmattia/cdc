module CDC
  describe Builder do
    describe '.from_file' do
      let(:file_path) { File.expand_path(File.join(File.dirname(__FILE__), '..', 'support', 'contract.json')) }
      let(:request) { stub('request') }
      let(:response) { stub('response') }
      let(:schema_class) { stub('schema class') }
      let(:schema) { stub('schema') }
      let(:contract) { stub('contract') }

      before { described_class.stub(:schema_class => schema_class) }

      it 'should build a new contract from a contract file' do
        Schema.should_receive(:new).with(a_kind_of(Hash)).and_return(schema)
        Request.should_receive(:new).with(:get, '/hello_world', {'Accept' => 'application/json'}, nil).and_return(request)
        Response.should_receive(:new).with(200, {'Content-Type' => 'application/json'}, schema).and_return(response)
        Contract.should_receive(:new).with(request, response).and_return(contract)
        described_class.from_file(file_path).should == contract
      end
    end
  end
end
