class Station

  attr_reader :name

  def initialize(station_name)
    @name = station_name
  end

  def self.all
    results = DB.exec("SELECT * FROM stations;")
    stations = []
    results.each do |name|
      station_name = name['name']
      stations << Station.new(station_name)
    end
    stations
  end

  def save
    DB.exec("INSERT INTO stations (name) VALUES ('#{@name}');")
  end

  def ==(another_station)
    self.name == another_station.name
  end

  def self.find_station_id(station_name)
    stations_id = nil
    Station.all.each do |station|
      if station.name == station_name
        return stations_id = stations.id.to_i
      end
    end
    stations_id
  end



end

