class Wagon
  include Manufacturer

  attr_reader :wagon_type

  def initialize(wagon_number)
    @wagon_number = wagon_number
    @wagon_type = wagon_type
  end

end