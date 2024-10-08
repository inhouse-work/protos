# frozen_string_literal: true

require "capybara/rspec"
require "phlex/testing/capybara"

RSpec.configure do |config|
  config.include Phlex::Testing::Capybara::ViewHelper
end
