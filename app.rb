require 'sinatra'
require 'pry'
require 'data_mapper'
require 'rubygems'

class Log
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
end

@@logs =["testy","tosty","tasty"]

get '/about' do
  erb :about
end

get '/' do
	@@logs << params[:log]
	erb :vueindex
end



#post'/vueindex' do
  #binding.pry
#end
