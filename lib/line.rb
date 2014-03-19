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
end
