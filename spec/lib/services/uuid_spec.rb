describe Services::Uuid do
  subject(:uuid) do
    described_class.new
  end

  describe '#call' do
    it 'returns output from SecureRandom.uuid' do
      allow(SecureRandom).to receive(:uuid).and_return('test-uuid')
      expect(uuid.call).to eq('test-uuid')
    end
  end
end
