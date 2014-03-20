class Stop

  attr_reader :train_id, :station_id, :time

  def initialize(train_result, station_result, time)
    @train_id = train_result
    @station_id = station_result
    @time = time
  end

  def self.all
    results = DB.exec("SELECT * FROM stops;")
    stops = []
    results.each do |train, station, time|
      train_id = train['id']
      station_id = station['id']
      time = time['id']
      stops << Stop.new(station_id, train_id, time)
    end
    stops
  end

  def save
    DB.exec("INSERT INTO stops (train_id, station_id, time) VALUES ('#{@train_id}', '#{@station_id}', '#{@time}');")
  end

  def ==(another)
    self.train_id == another.name
    self.station_id == another.name
    self.time == another.name
  end
end

