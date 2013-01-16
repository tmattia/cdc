module Cdc
  describe Response do
    describe '#matches?' do
      let(:status) { 200 }
      let(:headers) { {'Content-type' => 'application/json'} }
      let(:schema) { mock('schema') }
      let(:response) { described_class.new(status, headers, schema) }

      context 'when status and headers are the same and body matches expected schema' do
        let(:good_response) do
          stub({
            :status => status,
            :headers => headers,
            :body => 'foo'
          })
        end

        it 'should match' do
          schema.should_receive(:validate).with(good_response.body).and_return(true)
          response.matches?(good_response).should be_true
        end
      end

      context 'when status is different' do
        let(:different_status_response) do
          stub(:status => 404,
               :headers => headers,
               :body => 'foo')
        end

        it 'should not match' do
          response.matches?(different_status_response).should be_false
        end
      end

      context 'when headers are different' do
        let(:different_headers_response) do
          stub(:status => status,
               :headers => {'Content-type' => 'text/html'},
               :body => 'foo')
        end

        it 'should not match' do
          response.matches?(different_headers_response).should be_false
        end
      end

      context 'when body does not match expected schema' do
        let(:different_body_response) do
          stub(:status => status,
               :headers => headers,
               :body => 'bar')
        end

        it 'should not match' do
          schema.should_receive(:validate).with(different_body_response.body).and_return(false)
          response.matches?(different_body_response).should be_false
        end
      end
    end
  end
end
