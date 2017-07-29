# client
module Geolocator
  class Client
    
    def initialize(api_key = nil)
      @api_key = api_key || ENV['YANDEX_ACCESS_TOKEN']
    end
    
    def perform_request(common = nil, gsm_cells = nil, wifi_networks = nil, ip = nil)
      common = common || { common: {
          version: 1.0,
          api_key: @api_key }
      }.to_json
      
      gsm = gsm_cells || { gsm_cells: {
          countrycode: 250,
          operatorid: 99,
          cellid: 42332,
          lac: 36002,
          signal_strength: -80,
          age: 5555 }
      }.to_json
      
      wifi = wifi_networks || {
          wifi_networks: {
              mac: '00-1C-F0-E4-BB-F5',
              signal_strength: -88,
              age: 0 }
      }.to_json
      
      ip = ip || { ip: {
          address_v4: '178.247.233.32' }
      }.to_json
      
      json = "json=#{common}, #{gsm}, #{wifi}, #{ip}"
      
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

