# frozen_string_literal: true

require 'http'

module TaiGo
  class ApiGateway
    def initialize(config = TaiGo::App.config)
      @config = config
    end

    def update_route
      call_api(:post, ['bus', 'Hsinchu', 'routes'])
    end

    def call_api(method, resources)
      url_route = [@config.api_url, resources].flatten.join'/'
      result = HTTP.send(method, url_route)
      raise(result.to_s) if result.code >= 300
      result.to_s
    end
  end
end
