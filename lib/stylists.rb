class Stylist

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = atttributes.fetch(:name)
  end
