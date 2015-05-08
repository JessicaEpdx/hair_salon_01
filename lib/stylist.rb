class Stylist
attr_reader(:name, :id)

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING ID;")
    @id = result.first.fetch("id")
  end

  def self.all
    all_stylists = [ ]
    stylists = DB.exec("SELECT * FROM stylists;")
    stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i
      all_stylists.push(Stylist.new({:name => name, :id => id}))
    end
    all_stylists
  end

  def == (other_stylist)
    self.name() == other_stylist.name() 
  end



end
