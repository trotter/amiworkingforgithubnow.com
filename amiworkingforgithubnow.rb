require 'rubygems'
require 'sinatra'

mime_type :ttf, "application/octet-stream"
mime_type :woff, "application/octet-stream"

GITHUB_HANDLES = %w(
  amiridis
  atmos
  brianmario
  bryanveloso
  cameronmcefee
  defunkt
  demonbane
  eston
  holman
  joshaber
  kevinsawicki
  kneath
  luckiestmonkey
  mislav
  mojombo
  peff
  pjhyett
  probablycorey
  rodjek
  rtomayko
  schacon
  sr
  tanoku
  tater
  tclem
  technoweenie
  tekkub
  tmm1
)

get '/' do
  erb :index
end

post '/working' do
  if GITHUB_HANDLES.include?(params[:handle].downcase)
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
