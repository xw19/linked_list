require 'bundler/setup'
Bundler.setup

require 'linked_list_sourav'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :progress
end