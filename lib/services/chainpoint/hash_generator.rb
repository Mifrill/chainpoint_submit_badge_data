module Services
  module Chainpoint
    class HashGenerator
      def initialize(values:, generator: ->(string) { Digest::SHA256.hexdigest(string) })
        self.values = values
        self.generator = generator
      end

      def generate(separator: '_')
        generator.call(values.join(separator))
      end

      private

      attr_accessor :values, :generator
    end
  end
end
