# frozen_string_literal: true

folders = %w[config infrastructure application/representers]
folders.each do |folder|
  require_relative "#{folder}/init.rb"
end
