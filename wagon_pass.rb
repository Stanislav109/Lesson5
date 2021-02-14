class PassengerWagon < Wagon
  attr_reader :wagon_type

  def initialize(wagon_number)
    super
    @wagon_type = :passenger
  end

end