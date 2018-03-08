require 'simplecov'
SimpleCov.start

require 'time'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
# Add simplecov

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative '../lib/room'
require_relative '../lib/admin'
require_relative '../lib/reservation'


# require_relative '../lib/driver'
# require_relative '../lib/passenger'
# require_relative '../lib/trip'
# require_relative '../lib/trip_dispatcher'