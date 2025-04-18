# frozen_string_literal: true

require "memory_profiler"
require "protos"

require_relative "support/protos_table"
# require_relative "support/phlex_table"

# Force autoloading of tailwind merger
_ = Protos::Theme.merger

namespace :memory do
  desc "Memory report for Protos::Table"
  task :table do
    report = MemoryProfiler.report do
      ProtosTable.new.call
    end

    report.pretty_print(to_file: "tmp/memory-table.txt")
    puts "Memory report written to tmp/memory-table.txt"
  end

  desc "Memory report for Protos::Theme"
  task :theme do
    report = MemoryProfiler.report do
      Protos::Theme.new(foo: "bar").merge(foo: "baz", foo!: "quix")
    end

    report.pretty_print(to_file: "tmp/memory-theme.txt")
    puts "Memory report written to tmp/memory-theme.txt"
  end
end
