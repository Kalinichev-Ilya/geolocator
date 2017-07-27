# client
module Geolocator
  def initialize(access_token = nil)
    @access_token = access_token || ENV['YANDEX_ACCESS_TOKEN']
  end
end
