require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylists")
require("./lib/clients")
require("pg")

DB = PG.connect({:dbname => 'hair_salon'})

get("/") do
  @stylists = Stylist.all()
  # binding.pry
  erb(:index)
end

post('/') do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  binding.pry
  erb(:index)
end
