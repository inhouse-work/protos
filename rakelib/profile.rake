require "protos"
require "ruby-prof"

require_relative "support/protos_table"
require_relative "support/phlex_table"

namespace :profile do
  task :table do
    result = RubyProf::Profile.profile do
      Protos::Table.new.call
    end

    printer = RubyProf::FlatPrinter.new(result)
    printer.print(File.open("tmp/profile-table-flat.txt", "w+"))
  end
end
