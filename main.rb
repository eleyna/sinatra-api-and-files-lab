require 'rubygems'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'imdb'

get '/favorites' do
  @favorite_movie_list = File.new('movies.csv', 'r')
  erb :favorites
end

get '/new_movie' do
  erb :new_movie
end

post '/new_movie' do
  @new_movie = params[:new_movie]
  favorite_movie_list = File.new('movies.csv', 'a+')
  favorite_movie_list.puts @new_movie
  favorite_movie_list.close
  redirect to('/favorites')
end