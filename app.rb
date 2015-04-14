require 'bundler'
Bundler.require()

require './models/product'

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'coffee_ninja'
)

# Views
get '/' do
  erb :index
end

# RESTful api

# list all
get '/api/products' do
	content_type :json
 	products = Product.all
 	products.to_json
end

# list by id
get '/api/product/:id' do
	content_type :json
	id = params[:id].to_i
	product = Product.find(id)
	product.to_json
end