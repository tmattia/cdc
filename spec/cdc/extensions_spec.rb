describe Hash do
  describe '#subset_of?' do
    subject { {:a => 'a'} }

    context 'when hashes are equal' do
      let(:other) { {:a => 'a'} }
      it { should be_subset_of(other) }
    end

    context 'when keys have different case' do
      let(:other) { {:A => 'a'} }
      it { should be_subset_of(other) }
    end

    context 'when keys are of different type' do
      let(:other) { {'a' => 'a'} }
      it { should be_subset_of(other) }
    end

    context 'when keys and values match' do
      let(:other) { {'a' => 'a', 'b' => 'b'} }
      it { should be_subset_of(other) }
    end

    context 'when keys match but values do not' do
      let(:other) { {'a' => 'b', 'b' => 'c'} }
      it { should_not be_subset_of(other) }
    end
  end

  describe '#normalize' do
    it 'should convert keys into lowercase strings' do
      {:a => 'a'}.normalize.should == {'a' => 'a'}
      {:A => 'a'}.normalize.should == {'a' => 'a'}
      {'A' => 'a'}.normalize.should == {'a' => 'a'}
    end
  end
end
