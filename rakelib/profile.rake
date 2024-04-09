require "protos"
require "ruby-prof"

require_relative "support/protos_table"
require_relative "support/phlex_table"

def output_result(result)
  flat_printer = RubyProf::FlatPrinter.new(result)
  flat_printer.print(File.open("tmp/profile-table-flat.txt", "w+"))

  graph_printer = RubyProf::GraphHtmlPrinter.new(result)
  graph_printer.print(File.open("tmp/profile-table-graph.html", "w+"))

  call_stack_printer = RubyProf::CallStackPrinter.new(result)
  call_stack_printer.print(
    File.open(
      "tmp/profile-table-call-stack.html",
      "w+"
    )
  )
end

namespace :profile do
  desc "Run Protos::Table and Phlex::Table profile"
  task :table do
    result = RubyProf::Profile.profile do
      100.times do
        ProtosTable.new.call
      end
    end

    output_result(result)
  end

  desc "Run Protos::Attributes profile"
  task :attributes do
    attributes = Protos::Attributes.new(data: { controller: "foo" })

    result = RubyProf::Profile.profile do
      attributes.merge(data: { controller: "bar" })
    end

    output_result(result)
  end
end
