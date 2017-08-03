require_relative '../helpers/JSONator'

class RequestSerializer
  include JSONator
  attr_accessor :common, :wifi_networks, :gsm_cells, :ip
  
  def initialize(common, wifi_networks, gsm_cells, ip)
    @common = common
    @wifi_networks = wifi_networks
    @gsm_cells = gsm_cells
    @ip = ip
  end
  
end
