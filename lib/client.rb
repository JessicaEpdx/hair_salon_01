class Client
  attr_reader(:name, :id)

    def initialize (attributes)
      @name = attributes.fetch(:name)
      @id = attributes.fetch(:id).to_i
    end

    def save
      result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING ID;")
      @id = result.first.fetch("id")
    end

    def self.all
      all_clients = [ ]
      clients = DB.exec("SELECT * FROM clients;")
      clients.each() do |client|
        name = client.fetch("name")
        id = client.fetch("id").to_i
        all_clients.push(Client.new({:name => name, :id => id}))
      end
      all_clients
    end

    def == (other_client)
      self.name() == other_client.name()
    end

    def delete
      DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
    end

    def update (attributes)
      @name = attributes.fetch(:name, @name)
      @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
      DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{self.id()};")
      # DB.exec("UPDATE clients SET stylist_id = #{stylist_id} WHERE id = #{self.id()};")
    end




end
