require 'rubygems'
require 'sinatra'

$site_name = "Celebrity Site"

raise "foo"

get "/" do
  erb :index
end