require 'rubygems'
require 'sinatra'
require 'haml'
set :haml, {:format => :html5 }

get '/' do
	haml :index
end

get '/documentation' do
	haml :documentation
end

get '/samples' do
	haml :samples
end

get '/discuss' do
	haml :discuss
end

get '/quickstart' do
	haml :quickstart
end

get '/contribute' do
	haml :contribute
end

get '/contributors' do
	haml :contributoes
end

get '*' do
	haml :status404
end