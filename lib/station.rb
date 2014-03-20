class Station

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    stations = []
    results = DB.exec("SELECT * FROM station;")
    results.each do |result|
      # name = result['name']
      # id = result['id']
      stations << Station.new(result)
    end
    stations
  end

  def save
    results = DB.exec("INSERT INTO station (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end
  #Object initially doesn't have an ID. When saving it to the database, ID gets assigned then. Returning ID to the object that was just created (ID property).

  def ==(another_station)
    self.name == another_station.name
  end

  def get_name(id)
    @name
  end

  def all_lines
    all_lines = []
    results = DB.exec("SELECT * FROM stop WHERE station_id = #{self.id};")
    results.each do |result|
      line_id = result['line_id']
      line = DB.exec("SELECT * FROM line WHERE id = #{line_id};")
      all_lines << Line.new({'name' => "#{line.first['name']}"})
    end
    all_lines
  end

  def delete
    DB.exec("DELETE FROM station WHERE id = #{self.id};")
  end
end
