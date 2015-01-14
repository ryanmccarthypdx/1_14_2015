require('sinatra')
require('sinatra/reloader')
also_reload('/lib/**/*.rb')
require('./lib/used_cars')

get('/used_cars_form') do
  @title = "Used Cars"
  @vehicles = Vehicle.all()
  erb(:used_cars_form)
end

post('/vehicle') do
  @title = "Used Cars"
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year")
  vehicle = Vehicle.new(make, model, year)
  vehicle.save()
  @vehicles = Vehicle.all()
  erb(:used_cars_form)
end

get('/vehicles/:id') do
  @title = "Check out this beauty!"
  @vehicle = Vehicle.find(params.fetch("id"))
  erb(:vehicle)
end

# yourwebsite.com/vehicles/2
#
# yourwebsite.com/vehicles/4
#
# params
#
# 1. through a form (POST request)
# 2. throgh a get request (via URL)
# 3. through the routes
