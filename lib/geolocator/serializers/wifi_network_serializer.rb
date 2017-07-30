require_relative'JSONator'

class WifiNetworkSerializer < JSONator
  attr_reader :mac, :signal_strength, :age
  
  def initialize(mac, signal_strength, age)
    @mac = mac
    @signal_strength = signal_strength
    @age = age
  end
end
