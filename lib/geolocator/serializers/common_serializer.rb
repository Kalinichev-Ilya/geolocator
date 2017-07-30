require_relative 'JSONator'

class CommonSerializer < JSONator
  attr_reader :version, :api_key
  
  def initialize(version, api_key)
    @version = version
    @api_key = api_key
  end
end
