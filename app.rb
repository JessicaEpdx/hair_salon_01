require('sinatra')
require('sinatra/reloader')
require('./lib/stylist')
require('./lib/client')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

post('/clients') do
  name = params.fetch("client_name")
  client = Client.new({:name => name, :id => nil, :stylist_id => nil})
  client.save()
  @all_clients = Client.all()
  erb(:clients)
end

get('/clients') do
  @all_clients = Client.all()
  erb(:clients)
end

post('/stylists') do
  name = params.fetch("stylist_name")
  client = Stylist.new({:name => name, :id => nil})
  client.save()
  @all_stylists = Stylist.all()
  erb(:stylists)
end
