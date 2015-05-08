class Stylist
attr_reader(:name, :id)

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i
  end

  def save
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING ID;")
    @id = result.first.fetch("id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM stylists *;")
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

  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
    DB.exec("UPDATE clients SET stylist_id = 0 WHERE stylist_id = #{self.id()};")
  end

  def update (attributes)
    @name = attributes.fetch(:name)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{self.id()};")
  end

  def self.find (given_id)
    found_stylist= nil
    results = DB.exec("SELECT * FROM stylists WHERE id = #{given_id};")
    results.each() do |result|
      name = result.fetch("name")
      found_stylist = Stylist.new({:name => name, :id => given_id})
    end
    found_stylist
  end

  def clients
    clients = [ ]
    results = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    results.each() do |result|
      name = result.fetch("name")
      id = result.fetch("id").to_i
      clients.push(Client.new({:name => name, :id => id, :stylist_id => self.id()}))
    end
    clients
  end

end
