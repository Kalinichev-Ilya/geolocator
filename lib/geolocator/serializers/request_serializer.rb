require_relative '../helpers/JSONator'

class RequestSerializer
  include JSONator
  attr_accessor :common, :wifi_networks, :gsm_cells, :ip
  
  def initialize(common, wifi_networks, gsm_cells, ip)
    gsm_cells = gsm_cells.map { |s| s.to_json }
    wifi_networks = wifi_networks.map { |s| s.to_json }
    
    @common = common
    @wifi_networks = wifi_networks
    @gsm_cells = gsm_cells
    @ip = ip
  end
  
end
