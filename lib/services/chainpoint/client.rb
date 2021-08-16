module Services
  module Chainpoint
    class Client
      attr_reader :response

      def initialize(node_ip: '3.136.178.15')
        self.node_ip = node_ip
      end

      def submit(hash)
        request(path: 'hashes') do |body|
          body[:hashes] = [hash]
        end
      end

      private

      def request(path:)
        url = URI("http://#{node_ip}/#{path}")
        http = Net::HTTP.new(url.host, url.port || 80)
        body = {}
        yield(body)
        request = build_request(body, url)
        response = http.request(request)
        self.response = OpenStruct.new(JSON.parse(response.read_body))
      end

      def build_request(body, url)
        request = Net::HTTP::Post.new(url)
        request['Content-Type'] = 'application/json'
        request.body = body.to_json
        request
      end

      attr_accessor :node_ip
      attr_writer :response
    end
  end
end
