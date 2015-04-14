require 'bundler'
Bundler.require()

require './models/product'

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'coffee_ninja_app'
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
get '/api/products/:id' do
	content_type :json
	id = params[:id].to_i
	product = Product.find(id)
	product.to_json
end

# create 
post '/api/products' do
	content_type :json
	product_args = {name: params[:name], description: params[:description]}
	product = Product.create(product_args)
end

# update 
# future implementation
patch '/api/products/:id' do 
	content_type :json
	id = params[:id].to_i
	product = Product.find(id)
	product_args = {name: params[:name], description: params[:description]}
	product.update(product_args)
	product.to_json
end
# legacy implementation
put '/api/products/:id' do
	content_type :json
	id = params[:id].to_i
	product = Product.find(id)
	product_args = {name: params[:name], description: params[:description]}
	product.update(product_args)
	product.to_json
end

# delete
delete '/api/products/:id' do
	content_type :json
	id = params[:id].to_i
	Product.delete(id)
	{message:'Product removed'}.to_json
end
