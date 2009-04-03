require 'rubygems'
require 'sinatra'

Sinatra::Application.set(
  :run => false,
  :environment => ENV['RACK_ENV']
)

require 'application'
run Sinatra::Application