require_relative '../helpers/JSONator'

class IpSerializer
  include JSONator
  attr_reader :address_v4
  
  def initialize(address_v4)
    @address_v4 = address_v4
  end
end
