# client
module Geolocator
  class Client
    
    def initialize(api_key = nil)
      @api_key = api_key || ENV['YANDEX_ACCESS_TOKEN']
    end
    
    def perform_request
      common = { common: { version: 1.0, api_key: @api_key } }
      gsm = { gsm_cells: { countrycode: 250, operatorid: 99, cellid: 42332, lac: 36002, signal_strength: -80, age: 5555 } }
      wifi = { wifi_networks: { mac: '00-1C-F0-E4-BB-F5', signal_strength: -88, age: 0 } }
      ip = { ip: { address_v4: '178.247.233.32' } }
      
      json = 'json='+common.to_json.to_s + gsm.to_json.to_s + wifi.to_json.to_s + ip.to_json.to_s
      
      url = 'http://api.lbs.yandex.net/geolocation'
      response = HTTParty.post(url,
                               { body: json,
                                 headers: {
                                     :'Content-Type' => 'application/x-www-form-urlencoded'
                                 }
                               }
      )
      
      JSON.parse(response.body)
    end
  end
end

