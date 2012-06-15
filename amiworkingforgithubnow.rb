require 'rubygems'
require 'sinatra'
require 'json'
require 'net/https'

mime_type :ttf, "application/octet-stream"
mime_type :woff, "application/octet-stream"

get '/' do
  erb :index
end

get '/for/:handle/?' do
  if is_working_at_github?(params[:handle])
    erb :yes
  else
    erb :no
  end
end

post '/working' do
  if is_working_at_github?(params[:handle])
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

def is_working_at_github?(handle)
  req = Net::HTTP::Get.new("/api/v2/json/user/show/#{handle.downcase}/organizations")

  http = Net::HTTP.new("github.com", 443)
  http.use_ssl = true

  myorgs = JSON.parse(http.request(req).body)["organizations"]

  if myorgs.detect {|org| org["name"].eql?("GitHub")}
    return true
  else
    return false
  end
end
