require 'rubygems'
require 'sinatra'
require 'json'
require 'net/https'

mime_type :ttf, "application/octet-stream"
mime_type :woff, "application/octet-stream"

get '/' do
  erb :index
end

post '/working' do
  req = Net::HTTP::Get.new("/api/v2/json/user/show/#{params[:handle].downcase}/organizations")

  http = Net::HTTP.new("github.com", 443)
  http.use_ssl = true

  myorgs = JSON.parse(http.request(req).body)["organizations"]

  if !myorgs.select {|org| org["name"].eql?("GitHub")}.empty?
    erb :yes
  else
    erb :no
  end
end

get '/yes' do
  erb :yes
end

get '/no' do
  erb :no
end
