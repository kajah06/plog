require 'sinatra'
require 'pry'
require 'data_mapper'
require 'rubygems'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Log
  include DataMapper::Resource
  property :id, Serial
  property :nom, String
  property :email, String
  property :message, Text
  property :created_at, DateTime
end

DataMapper.finalize
Log.auto_upgrade!

get '/about' do
  erb :about
end

get '/' do
	@logs = Log.all
	erb :vueindex
end

get '/delete/:id' do
 Log.get(params[:id]).destroy 
 redirect '/'
  end

post '/update/:id' do
@log = Log.get(params[:id])
@log.update(:auteur => params[:auteur],:contenu => params[:log])
redirect '/'
end


post'/vueindex' do
  Log.create(email: params[:email], nom: params[:nom] , message: params[:message] )
  redirect '/'
end
