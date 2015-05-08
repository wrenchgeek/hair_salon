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

end
