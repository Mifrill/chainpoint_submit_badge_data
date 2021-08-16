module Services
  module Chainpoint
    class Submit
      def initialize(hash:, client: Services::Chainpoint::Client.new)
        self.hash = hash
        self.client = client
      end

      def call
        tap do
          client.submit(hash)
          self.response_hashes = client.response.hashes
        end
      end

      def proof_id
        response_hashes.last['proof_id']
      end

      private

      attr_accessor :hash, :client, :response_hashes
    end
  end
end
