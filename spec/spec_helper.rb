# frozen_string_literal: true

require "debug"
require "phlex/testing/capybara"

require "protos"

RSpec.configure do |config|
  config.include Phlex::Testing::Capybara::ViewHelper
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Dir[File.join(__dir__, "support/**/*.rb")].each { |file| require file }
