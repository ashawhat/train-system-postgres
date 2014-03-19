class Train

  attr_reader :name

  def initialize(train_name)
    @name = train_name
  end
def self.all
    database = PG.connect({:dbname => 'train_map'})
    results = database.exec("SELECT * FROM trains;")
    trains = []
    results.each do |name|
      train_name = name['name']
      trains << Train.new(train_name)
    end
    trains
  end

  def save
    database = PG.connect({:dbname => 'train_map'})
    database.exec("INSERT INTO trains (name) VALUES ('#{@name}');")
  end

  def ==(another_train)
    self.name == another_train.name
  end

end
