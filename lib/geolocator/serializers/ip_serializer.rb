require_relative 'JSONator'

class IpSerializer < JSONator
  attr_reader :address_v4
  
  def initialize(address_v4)
    @address_v4 = address_v4
  end
end
