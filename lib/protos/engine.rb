# frozen_string_literal: true

module Protos
  class Engine < ::Rails::Engine
    # DOCS: This is the engine for the Protos gem. It allows autoloading the lib
    # when used inside a Rails app.

    config.autoload_paths << File.expand_path("lib", __dir__)
  end
end
