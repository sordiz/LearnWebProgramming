require 'sinatra'
require_relative 'air_conditioner'
require_relative 'employee'
require_relative 'electoral_college'

air_conditioner = AirConditioner.new
votes = Array.new

# Task 4
get '/' do
  @welcome_message = "People at the office is fighting about the air conditioner temperature, " \
         "some want the air conditioner to be turned off and some want it very cold. " \
         "Lets solve this problem democratically by creating and application were they " \
         "can vote the desired AC temperature."
  @current_votes = votes.size()
  erb :index
end

# Task 5
post '/votes' do
  employee = Employee.new
  employee.name = params[:name]
  employee.category = params[:category]
  employee.desired_AC_temperature = params[:temperature].to_i
  votes.push(employee)
  erb "Thanks for voting."
end

# Task 6
post '/calculate_votes' do
  ec = ElectoralCollege.new
  result = ec.calculate_winning_temperature(votes)
  erb "The winning temperaure is: #{result.to_s}"
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
