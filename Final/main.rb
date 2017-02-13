require 'mongo'
require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'air_conditioner'

class SampleApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure do
    enable :sessions
    client = Mongo::Client.new(["127.0.0.1:27017"], database: "voting_app")
    set :mongo, client
  end

  before do
    p "REQUEST FROM: " + request.host
  end

  get '/login' do
    session[:login_status] = "Logged"
  end

  get '/logout' do
    session[:login_status] = "Not logged"
  end

  get '/decrement_temperature' do
    AirConditioner.instance.decrement_temperature
    redirect '/'
  end

  get '/switch_on_off' do
    AirConditioner.instance.switch
    redirect '/'
  end

  get '/increment_temperature' do
    AirConditioner.instance.increment_temperature
    redirect '/'
  end

  get '/sumar/:a/:b' do
    (params[:a].to_i + params[:b].to_i).to_s
  end

  post '/vote' do
    settings.mongo[:votes].insert_one(
      {"email"       => params[:email],
       "temperature" => params[:temperature],
       "created_at" => Time.now})
    redirect '/'
  end

  get '/' do
    @votes = []
    settings.mongo[:votes].find.each do |doc|
      doc.delete_if {|key, value| key == "_id" }
      @votes << doc
    end
    @temperature = AirConditioner.instance.temperature
    @is_on = AirConditioner.instance.is_on
    erb 'votes'.to_sym
  end

  get '/inline/:name' do
    @name = params[:name]
    erb :inline_template
  end

  after do
    p "RESPONSE: " + response.to_s
  end
end

__END__

@@ layout
Login status: <%= session[:login_status] %>
</br>
<%= yield %>

@@ inline_template
Hello <%= @name %>, I am an Inline Template.
