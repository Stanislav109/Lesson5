class Station
  include InstanceCounter
  
  attr_reader :name, :trains

  def self.all_stations
    @@all_stations
  end

  @@all_stations = []

  def initialize(name)
    #пользователь может создавать станции
    @name = name
    @trains = []
    register_instance
    @@all_stations << self
  end

  
  protected

  def get_train(train)
    #пользователь не может принять станцией поезд
    self.trains << train
  end

  def send_train(train)
    #пользователь не может послать станией поезд
    self.trains.delete(train)
  end

end






