class Station

  attr_reader :name

  def initialize(station_name)
    @name = station_name
  end

  def self.all
    database = PG.connect({:dbname => 'train_map'})
    results = database.exec("SELECT * FROM stations;")
    stations = []
    results.each do |name|
      station_name = name['name']
      stations << Station.new(station_name)
    end
    stations
  end

  def save
    database = PG.connect({:dbname => 'train_map'})
    database.exec("INSERT INTO stations (name) VALUES ('#{@name}');")
  end

  def ==(another_station)
    self.name == another_station.name
  end
end

