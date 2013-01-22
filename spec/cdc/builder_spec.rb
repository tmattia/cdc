module Cdc
  describe Builder do
    describe '.from_file' do
      let(:file_path) { File.expand_path(File.join(File.dirname(__FILE__), '..', 'support', 'contract.json')) }

      it 'should create a new Contract from a contract file' do
        pending('waiting for default service implementation')
        contract = described_class.from_file(file_path)
        contract.should be_valid
      end
    end
  end
end
