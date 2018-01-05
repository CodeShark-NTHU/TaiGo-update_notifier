# frozen_string_literal: true

require 'econfig'

require_relative '../init.rb'

extend Econfig::Shortcut
Econfig.env = ENV['WORKER_ENV'] || 'production'
Econfig.root = '.'

puts 'Updating the Routes'
TaiGo::ApiGateway.new.update_routes
puts 'Updating the Stops'
TaiGo::ApiGateway.new.update_stops
puts 'Updating the Stop Of Routes'
TaiGo::ApiGateway.new.update_stop_of_routes
puts 'All Data has been updated'
