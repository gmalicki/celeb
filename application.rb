require 'rubygems'
require 'sinatra'

$site_name = "Celebrity Site"

get "/" do
  erb :index
end