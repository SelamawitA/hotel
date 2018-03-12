require 'simplecov'
SimpleCov.start

require 'time'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
# Add simplecov

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative '../lib/admin'
require_relative '../lib/reservation'
