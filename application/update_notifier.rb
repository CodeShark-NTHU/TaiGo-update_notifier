# frozen_string_literal: true

require 'econfig'

require_relative '../init.rb'

extend Econfig::Shortcut
Econfig.env = ENV['WORKER_ENV'] || 'development'
Econfig.root = '.'
# Econfig.root = File.expand_path('..', File.dirname(__FILE__))

puts 'Updating the Routes'
routes_json = TaiGo::ApiGateway.new.update_route
all_routes = TaiGo::BusRoutesRepresenter.new(OpenStruct.new).from_json routes_json
puts all_routes
