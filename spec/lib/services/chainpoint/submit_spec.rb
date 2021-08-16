describe Services::Chainpoint::Submit do
  subject(:submit) do
    described_class.new(hash: 'test-hash')
  end

  let(:client_klass) { Services::Chainpoint::Client }
  let(:client) { instance_double(client_klass) }
  let(:response) { instance_double('response') }
  let(:hashes) { [{ 'proof_id' => 'test-proof-id' }] }

  describe '#call' do
    it 'returns class instance and defines response_hashes' do
      allow(client_klass).to receive(:new).and_return(client)
      allow(client).to receive(:submit).with('test-hash')
      allow(client).to receive(:response).with(no_args).and_return(response)
      allow(response).to receive(:hashes).with(no_args).and_return(hashes)
      expect(submit.call).to eq(submit)
      expect(submit.send(:response_hashes)).to eq(hashes)
    end
  end

  describe '#proof_id' do
    context 'when response_hashes not defined' do
      it { expect { submit.proof_id }.to raise_exception(NoMethodError) }
    end

    context 'when response_hashes is defined' do
      before do
        allow(client_klass).to receive(:new).and_return(client)
        allow(client).to receive(:submit).with('test-hash')
        allow(client).to receive(:response).with(no_args).and_return(response)
        allow(response).to receive(:hashes).with(no_args).and_return(hashes)
        submit.call
      end

      it 'returns proof_id from last hash' do
        expect(submit.proof_id).to eq('test-proof-id')
      end
    end
  end
end
