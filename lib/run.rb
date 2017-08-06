require_relative 'geolocator'

client = Geolocator::Client.new('ADV6fFkBAAAAclZ3VAMBWcneV6qzQ4LK2EVFLw6LFO_ITtMAAAAAAAAAAAA18gaUA7A5aVVfG4Wn7S4D0hQGAQ==')

gsm_cells = []
wifi_networks = []

# Initialization of parameters
common = CommonSerializer.new(1.0, client.api_key).to_json
gsm_cells << GsmCellSerializer.new(250, 99, 42332, 36002, nil, nil)
gsm_cells << GsmCellSerializer.new(250, 99, 42332, 36002, nil, nil)
wifi_networks << WifiNetworkSerializer.new('00-1C-F0-E4-BB-F5', nil, nil)
ip = IpSerializer.new('178.247.233.32').to_json

# get request
client.perform_request(common, gsm_cells, wifi_networks, ip)


