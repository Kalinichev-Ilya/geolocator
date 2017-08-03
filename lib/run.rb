require_relative 'geolocator'
require 'pp'

client = Geolocator::Client.new('ADV6fFkBAAAAclZ3VAMBWcneV6qzQ4LK2EVFLw6LFO_ITtMAAAAAAAAAAAA18gaUA7A5aVVfG4Wn7S4D0hQGAQ==')
client.perform_request
