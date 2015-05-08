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

delete('/stylists') do
  stylist = Stylist.find(params.fetch("stylist_id").to_i)
  stylist.delete()
  @all_stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists') do
  @all_stylists = Stylist.all()
  erb(:stylists)
end

get('/clients/:id') do
  @client = Client.find(params.fetch("id"))
  @stylist_id = @client.stylist_id()
  erb(:client)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id"))
  @all_clients = Client.all()
  @clients = @stylist.clients()
  erb(:stylist)
end

patch('/success') do##make patch later
  @stylist = Stylist.find(params.fetch("stylist_id"))
  stylist_id = @stylist.id().to_i
  @client = Client.find(params.fetch("client_id").to_i)
  @client.update({:stylist_id => stylist_id})
  erb(:success)
end

patch('/success/stylist') do
  @stylist = Stylist.find(params.fetch("stylist_id"))
  @stylist.update({:name => params.fetch("name")})
  erb(:success_stylist)
end

delete('/clients') do
  client = Client.find(params.fetch("client_id").to_i)
  client.delete()
  @all_clients = Client.all()
  erb(:clients)
end

patch('/success/client') do
  @client = Client.find(params.fetch("client_id").to_i)
  @client.update({:name => params.fetch("name")})
  erb(:success_client)
end
