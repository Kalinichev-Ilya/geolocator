require_relative '../helpers/JSONator'

class GsmCellSerializer
  include JSONator
  attr_reader :countrycode, :operatorid, :cellid, :lac, :signal_strength, :age
  
  def initialize (countrycode, operatorid, cellid, lac, signal_strength, age)
    @countrycode = countrycode
    @operatorid = operatorid
    @cellid = cellid
    @lac = lac
    @signal_strength = signal_strength
    @age = age
  end
end
