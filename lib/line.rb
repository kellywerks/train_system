class Line

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

   def self.all
    lines = []
    results =  DB.exec("SELECT * FROM line;")
    results.each do |result|
      # name = result['name']
      # id = result['id']
      lines << Line.new(result)
    end
    lines
  end

  def save
    results = DB.exec("INSERT INTO line (name) VALUES ('#{@name}') RETURNING id;")
     @id = results.first['id'].to_i
  end

  def ==(another_line)
    self.name == another_line.name
  end

  def all_stations
    all_stations = []
    results = DB.exec("SELECT * FROM stop WHERE line_id = #{self.id};")
    results.each do |result|
      #results is equal to the number of stations on the corrresponding line
      station_id = result['station_id']
      #go to the STATION table with the new number
      station = DB.exec("SELECT * FROM station WHERE id = #{station_id};")
      ##{station_id} is from line
      all_stations << Station.new({'name' => "#{station.first['name']}"})
      #station from line 37
      #creating new object (in order to run methods on) to put into empty array
    end
    all_stations
  end
#self.id refers back to the id that was created with the object line.new
#listing all stations in a particular line
# go into STOPS table to grab the station id by entering the line id ()

  def delete
    DB.exec("DELETE FROM line WHERE id = #{self.id};")
  end

end
