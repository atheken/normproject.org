require 'rubygems'
require 'sinatra'
require 'haml'
set :haml, {:format => :html5 }

get '/' do
	haml :index
end
get '/documentation'
	haml :documentation
end
get '/samples'
	haml :samples
end
get '/discuss'
	haml :discuss
end
get '/quickstart'
	haml :quickstart
end
get '/contribute'
	haml :contribute
end
get '/contributors'
	haml :contributoes
end
get '*' do
	haml :status404
end