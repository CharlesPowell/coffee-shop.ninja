require 'bundler'
Bundler.require()

# Routes
get '/' do
  erb :index
end