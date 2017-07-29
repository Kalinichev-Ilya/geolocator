# client
module Geolocator
  class Client
    
    def initialize(api_key = nil)
      @api_key = api_key || ENV['YANDEX_ACCESS_TOKEN']
    end
    
    def perform_request
      json = "json={
                    \"common\": {
                                 \"version\": \"1.0\",
                                 \"api_key\": \"#{@api_key}\"
                     },
                    \"gsm_cells\": [
                                      {
                                       \"countrycode\": 250,
                                       \"operatorid\": 99,
                                       \"cellid\": 42332,
                                       \"lac\": 36002,
                                       \"signal_strength\": -80,
                                       \"age\": 5555
                       }
                     ],
                    \"wifi_networks\": [
                                         {
                                          \"mac\": \"00-1C-F0-E4-BB-F5\",
                                          \"signal_strength\": -88,
                                          \"age\": 0,
                      }
                     ],
                    \"ip\": {
                            \"address_v4\": \"178.247.233.32\"
                     }
                    }"
      
      url = 'http://api.lbs.yandex.net/geolocation'
      response = HTTParty.post(url,
                               { :body => json,
                                 :headers => {
                                     :'Content-Type' => 'application/x-www-form-urlencoded',
                                     :'Accept' => 'application/json'
                                 } }
      )
      
      JSON.parse(response.body)
    end
  end
end

