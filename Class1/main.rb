require 'sinatra'
require_relative 'air_conditioner'

air_conditioner = AirConditioner.new

# Task 1
get '/' do
  return "People at the office is fighting about the air conditioner temperature, " \
         "some want the air conditioner to be turned off and some want it very cold. " \
         "Lets solve this problem democratically by creating and application were they " \
         "can vote the desired AC temperature."
end

# Task 2
get '/ac/status' do
  message = "The air conditioner is "
  if air_conditioner.status == 'ON'
    message << "ON with a temperature of #{air_conditioner.temperature.to_s}"
  else
    message << "OFF."
  end

  return message
end

# Taask 3
get '/ac/turn_on' do
  air_conditioner.turn_on
  return "Air conditioner was turned ON."
end

get '/ac/turn_off' do
  air_conditioner.turn_off
  return "Air conditioner was turned OFF."
end
