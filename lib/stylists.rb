class Stylist

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch('id')
      stylists.push(Stylist.new({:name => name, :id => id,}))
    end
    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name()).&(self.id().to_i().==(another_stylist.id().to_i()))
  end

  define_singleton_method(:find) do |id|
    @id = id
    results = DB.exec("SELECT * FROM stylists WHERE id = #{@id};")
    @name = results.first().fetch('name')
    Stylist.new({:name => @name, :id => @id})
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id};")
  end

  define_method(:assign) do |client|
    DB.exec("INSERT INTO stylists_clients (stylist_id, client_id) VALUES (#{self.id}, #{client.id});")
  end

  define_method(:all_assigns) do
    returned_clients = DB.exec("SELECT * FROM stylists_clients WHERE stylist_id = #{self.id()};")
    clients = []
    returned_clients.each() do |client|
      @id = client.fetch("client_id")
      new_client = Client.find(@id)
      clients.push(new_client)
    end
    clients
  end
end
