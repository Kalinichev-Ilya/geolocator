require_relative 'serializers/ip_serializer'
require_relative 'serializers/wifi_network_serializer'
require_relative 'serializers/common_serializer'
require_relative 'serializers/gsm_cell_serializer'
require_relative 'serializers/request_serializer'
require_relative 'helpers/JSONator'

# client
module Geolocator
  class Client
    attr_reader :api_key
    
    def initialize(api_key = nil)
      @api_key = api_key || ENV['YANDEX_ACCESS_TOKEN']
    end
    
    def perform_request(common = nil, gsm_cells = nil, wifi_networks = nil, ip = nil)
      
      json = "json=#{request_builder!(common, wifi_networks, gsm_cells, ip)}"
      response = HTTParty.post('http://api.lbs.yandex.net/geolocation',
                               {
                                   body: json
                               }
      )
      
      puts JSON.parse(response.body)
    end
    
    private
    
    def request_builder!(common, wifi_networks, gsm_cells, ip)
      json = RequestSerializer.new(common, wifi_networks, gsm_cells, ip).to_json.delete '\\'
      json.gsub!(/"{/, '{')
      json.gsub!(/}"/, '}')
    end
  
  end
end

