class Train
  include Manufacturer
  include InstanceCounter

  attr_accessor :speed, :station, :wagons
  attr_reader :type, :number, :route

  def self.find_train(number)
    @@all_trains[number.to_s] 
  end 

  @@all_trains = {}

  def initialize(number)
    #пользователь может создавать поезда
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    @@all_trains[self.number] = self
  end

  def add_wagons(wagon)
    #пользователь может добавлять вагоны
    if self.speed == 0
      self.wagons << wagon
    else
      puts "You must stop"
    end
  end

  def delete_wagons(wagon)
    #пользователь может отцеплять вагоны
    if self.speed == 0
      self.wagons.delete(wagon)
    else
      puts "You must stop"
    end
  end

  def route=(route)
    #пользователь может назначать маршрут поезду
    @route = route
    self.station = self.route.stations.first
  end

  def move_next_station
    #пользователь может перемещать поезд по маршруту вперед
      self.station = self.route.stations[self.route.stations.index(self.station) + 1]
  end

  def move_previous_station
    #пользователь может перемещать поезд по маршруту назад
    self.station = self.route.stations[self.route.stations.index(self.station) - 1]
  end

  def next_station
    #пользователь может просматривать следующую станию
    self.route.stations[self.route.stations.index(self.station) + 1]
  end

  def previous_station
    #пользователь может просматривать предыдущую станию
    self.route.stations[self.route.stations.index(self.station) - 1]
  end

  protected 

  def boost_speed(speed)
    #пользователь не может увеличивать скорость поезда
    self.speed += speed
  end

  def stop
    #пользователь не может останавливать поезд
    self.speed = 0
  end
end

