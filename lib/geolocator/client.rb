require_relative 'serializers/ip_serializer'
require_relative 'serializers/wifi_network_serializer'
require_relative 'serializers/common_serializer'
require_relative 'serializers/gsm_cell_serializer'
require_relative 'serializers/request_serializer'
require_relative 'helpers/JSONator'

# client
module Geolocator
  class Client
    def initialize(api_key = nil)
      @api_key = api_key || ENV['YANDEX_ACCESS_TOKEN']
    end
    
    def perform_request(common = nil, gsm_cells = [] || nil, wifi_networks = [] || nil, ip = nil)
      
      # ----- Input
      common = CommonSerializer.new(1.0, @api_key).to_json
      gsm_cells << GsmCellSerializer.new(250, 99, 42332, 36002, nil, nil)
      gsm_cells << GsmCellSerializer.new(250, 99, 42332, 36002, nil, nil)
      wifi_networks << WifiNetworkSerializer.new('00-1C-F0-E4-BB-F5', nil, nil)
      ip = IpSerializer.new('178.247.233.32').to_json
      # Input ----
      
      # Format input ------
      gsm_json = gsm_cells.map { |s| s.to_json }
      wifi_json = wifi_networks.map { |s| s.to_json }
      request = RequestSerializer.new(common, wifi_json, gsm_json, ip).to_json
      json = "json=#{request}".delete '\\'
      json.gsub!(/"{/, '{')
      json.gsub!(/}"/, '}')
      # ------- Format input
      
      response = HTTParty.post('http://api.lbs.yandex.net/geolocation',
                               { body: json,
                                 headers: {
                                     :'Content-Type' => 'application/x-www-form-urlencoded' }
                               }
      )
      
      puts JSON.parse(response.body)
    end
  end
end

