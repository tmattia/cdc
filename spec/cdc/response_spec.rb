module CDC
  describe Response do
    describe '#matches?' do
      let(:status) { 200 }
      let(:headers) { {'Content-Type' => 'application/json'} }
      let(:schema) { mock('schema') }
      let(:response) { described_class.new(status, headers, schema) }

      context 'when status, headers and body meet contract expectations' do
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
          schema.stub!(:validate)
          response.matches?(different_status_response).should be_false
        end
      end

      context 'when actual headers include expected headers' do
        let(:inclusive_headers_response) do
          stub(:status => status,
               :headers => {'Content-Type' => 'application/json',
                            'Age' => 60},
               :body => 'foo')
        end

        it 'should match' do
          schema.stub!(:validate => true)
          response.matches?(inclusive_headers_response).should be_true
        end
      end

      context 'when actual headers do not include expected headers' do
        let(:different_headers_response) do
          stub(:status => status,
               :headers => {'Content-Type' => 'text/html'},
               :body => 'foo')
        end

        it 'should not match' do
          schema.stub!(:validate)
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
