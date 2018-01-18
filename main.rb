
require 'sinatra'
# require 'sinatra/reloader'
require_relative 'db_config.rb'
require_relative 'models/user'
require_relative 'models/city'
require_relative 'models/house'
require_relative 'models/comment'
# require 'pry'
enable :sessions


get '/' do
  erb :index
end

get '/melbourne' do
  @houses = House.where(city_id: 1)
  # wrote House.find_by(city_id: 1) but find or find_by always return the first one, not an array
  erb :'cities/melbourne'
end
get '/sydney' do
  @houses = House.where(city_id: 2)
  erb :'cities/sydney'
end
get '/brisbane' do
  @houses = House.where(city_id: 3)
  erb :'citiesbrisbane'
end
get '/perth' do
  @houses = House.where(city_id: 4)
  erb :'cities/perth'
end
get '/darwin' do
  @houses = House.where(city_id: 5)
  erb :'cities/darwin'
end
get '/cairns' do
  @houses = House.where(city_id: 6)
  erb :'cities/cairns'
end

get '/users/become_a_host' do
   erb :'users/become_a_host'
end

get '/login/signup' do
  erb :'login/signup'
end

get '/login/signin' do
  erb :'login/signin'
end

post '/login' do
   @user = User.new
   @user.name = params[:name]  # @user is a object so use dot notation not[:]
   @user.email = params[:email]
   @user.img_url = params[:photo_url]
   @user.password = params[:password]
   @user.save
   session[:user_id] = @user.id
   redirect "/users/#{@user.id}"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

post '/session' do
   @user = User.find_by(email: params[:email])
   if @user && @user.authenticate(params[:password]) #(user.password == params[:password])
     session[:user_id] = @user.id # session is a hash we just created a new hash session
      redirect "/users/#{@user.id}"
   else
     erb :'login/signin'
   end
end

delete '/session' do
   session[:user_id] = nil
   redirect '/'
end

get '/users/:id/register_house' do
  @user = User.find(params[:id])
  erb :'users/register_house'
end

post '/houses' do
   @house = House.new
   @house.city = params[:city]
   city = City.find_by(name: @house.city)
   @house.address = params[:address]
   @house.title = params[:title]
   @house.guest = params[:guest]
   @house.beds = params[:beds]
   @house.bath = params[:bath]
   @house.kitchen = params[:kitchen]
   @house.headlines = params[:headlines]
   @house.about_space = params[:about_space]
   @house.guest_access = params[:guest_access]
   @house.cancellations = params[:cancellations]
   @house.house_rules = params[:house_rules]
   @house.house_image1 = params[:house_image1]
   @house.house_image2 = params[:house_image2]
   @house.house_image3 = params[:house_image3]
   @house.house_image4 = params[:house_image4]
   @house.house_image5 = params[:house_image5]
   @house.user_id = params[:user_id]
   @house.city_id = city.id
   @house.save

   redirect "/houses/#{@house.id}"
end

get '/houses/:id' do
  @house = House.find(params[:id])
  @user = User.find_by(id: "#{@house.user_id}")
  erb :'houses/show'
end
