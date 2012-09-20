require 'rubygems'
require 'bundler'

Bundler.setup(:default, ENV['RACK_ENV'])

require './share'

run Share
