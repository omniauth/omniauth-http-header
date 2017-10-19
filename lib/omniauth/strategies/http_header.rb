require 'omniauth'

module OmniAuth
  module Strategies
    class HttpHeader
      include OmniAuth::Strategy

      option :name, 'http_header'

      option :authorization_uri, nil
      option :uid_header, 'X-Forwarded-User'
      option :info_headers, {}
      option :remote_ip, nil

      def request_phase
        if options.authorization_uri
          redirect options.authorization_uri
        else
          raise ::OmniAuth::Error, 'authorization_uri is undefined'
        end
      end

      def callback_phase
        if options.remote_ip && !Array(options.remote_ip).include?(request.ip)
          raise ::OmniAuth::Error, "Callback from unauthorized IP #{request.ip}"
        end

        super
      end

      uid do
        fetch_header options.uid_header
      end

      info do
        options.info_headers.each_with_object({}) do |(attribute, header), info|
          info[attribute] = fetch_header header
        end
      end

      private

      def fetch_header(header)
        request.env.fetch "HTTP_#{header.upcase.gsub('-', '_')}"
      end
    end
  end
end
