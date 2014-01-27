require 'sinatra'
require_relative 'models/artist'

enable :sessions

get '/' do
  puts params
  @artists = Artist.all

  erb :index
end

get '/success' do
  @name = session[:name]
  erb :success
end

get '/:name' do
  @name = params[:name]

  erb :hello
end

get '/artists/new' do
  erb :new
end

post '/artists' do
  puts "#{params[:name]} created! :)"

  session[:name] = params[:name]
  redirect '/success'
end


