require 'sinatra'
require 'mongoid'
require_relative 'air_conditioner'
require_relative 'employee'
require_relative 'electoral_college'

air_conditioner = AirConditioner.new
Mongoid.load!("mongoid.yml")
enable :sessions

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

# Task 4
get '/' do
  @welcome_message = "People at the office is fighting about the air conditioner temperature, " \
         "some want the air conditioner to be turned off and some want it very cold. " \
         "Lets solve this problem democratically by creating and application were they " \
         "can vote the desired AC temperature."
  @current_votes = Employee.all.size()
  @last_employee_name ||= session[:last_employee_name]
  @last_employee_category ||= session[:last_employee_category]
  @last_employee_temperature ||= session[:last_employee_temperature]
  erb :index
end

# Task 5
post '/votes' do
  Employee.create(
	 name: params[:name],
	 category: params[:category],
   desired_AC_temperature: params[:temperature].to_i)

  session[:last_employee_name] = params[:name]
  session[:last_employee_category] = params[:category]
  session[:last_employee_temperature] = params[:temperature]

  erb "Thanks for voting."
end

# Task 6
post '/calculate_votes' do
  ec = ElectoralCollege.new
  result = ec.calculate_winning_temperature(Employee.all)
  erb "The winning temperaure is: #{result.to_s}"
end

# Task 10
get '/votes' do
  content_type :json
  Employee.all.to_json
end
