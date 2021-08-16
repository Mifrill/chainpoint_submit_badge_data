describe Services::Chainpoint::Client do
  subject(:client) do
    described_class.new
  end

  describe '#submit' do
    it 'returns class instance and defines response_hashes' do
      VCR.use_cassette('chainpoint_network_submit') do
        client.submit('TEST_HASH')
      end
      expect(client.response).to be_kind_of(OpenStruct)
      expect(client.response.hashes)
        .to eq(
          [
            {
              'hash' => 'c49dabdfaea9255289fa36c0743ac152789a5bcf22abebc54691d8f9f54a3647',
              'proof_id' => '83831fa0-fe66-11eb-8ef4-0122aa65d76d'
            }
          ]
        )
    end
  end
end
