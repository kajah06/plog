require 'sinatra'
require 'pry'

@@logs =["testy","tosty","tasty"]

get '/about' do
  erb :about
end

get '/' do
	erb :vueindex
end

post '/' do
	@@logs << params[:log]
	erb :vueindex
end
