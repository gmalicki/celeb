require 'rubygems'
require 'sinatra'

$site_name = "Celebrity Site"


get "/foo" do
  "hello world"
end

get "/" do
  erb :index
end