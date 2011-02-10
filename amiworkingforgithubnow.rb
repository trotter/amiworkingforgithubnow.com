require 'rubygems'
require 'sinatra'

GITHUB_HANDLES = %w(
  amiridis
  atmos
  brianmario
  bryanveloso
  cameronmcefee
  defunkt
  eston
  holman
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
  tclem
  technoweenie
  tekkub
  tmm1
)

get '/' do
  erb :index
end

post '/working' do
  @working = GITHUB_HANDLES.include?(params[:handle])
  erb :working
end
