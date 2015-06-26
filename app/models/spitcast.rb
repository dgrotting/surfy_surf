require 'httparty'

class Spitcast
    include HTTParty
    base_uri "api.spitcast.com"

    def initialize
    end

    def all_reports
      self.class.get('/api/spot/all')
    end
end
