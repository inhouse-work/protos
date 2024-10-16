# frozen_string_literal: true

require "capybara/rspec"
require "phlex/testing"

RSpec.configure do |config|
  config.include Phlex::Testing::Capybara
end
