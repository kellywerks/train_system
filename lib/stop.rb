class Stop

  attr_reader :station_id, :line_id, :id

  def initialize(attributes)
    @station_id = attributes['station_id']
    @line_id = attributes['line_id']
    @id = attributes['id']
  end

  def self.all
    stops = []
    results = DB.exec("SELECT * FROM stop;")
    results.each do |result|
      stops << Stop.new(result)
    end
    stops
  end

  def save
    results = DB.exec("INSERT INTO stop (station_id, line_id) VALUES ('#{@station_id}', '#{@line_id}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_stop)
    self.station_id.to_i == another_stop.station_id.to_i && self.line_id.to_i == another_stop.line_id.to_i
  end
end
