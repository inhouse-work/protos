# frozen_string_literal: true

require "memory_profiler"
require "protos"

require_relative "support/protos_table"
# require_relative "support/phlex_table"

namespace :memory do
  desc "Memory report for Protos::Table"
  task :table do
    report = MemoryProfiler.report do
      ProtosTable.new.call
    end

    report.pretty_print(to_file: "tmp/memory.txt")
    puts "Memory report written to tmp/memory.txt"
  end
end
