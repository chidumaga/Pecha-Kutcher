# Generated by cucumber-sinatra. (2015-05-14 17:56:03 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/pecha_kutcher.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Pecha_Kutcher

class Pecha_KutcherWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  Pecha_KutcherWorld.new
end