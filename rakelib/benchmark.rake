require "benchmark"
require "benchmark/ips"
require "benchmark/memory"
require "protos"

require_relative "support/protos_table"
require_relative "support/phlex_table"

namespace :benchmark do
  namespace :ips do
    desc "Run Protos::Table and Phlex::Table ips benchmarks"
    task :table do
      Benchmark.ips do |x|
        x.report("Protos::Table") do
          ProtosTable.new.call
        end

        x.report("Phlex::Table") do
          PhlexTable.new.call
        end

        x.compare!
      end
    end
  end

  namespace :memory do
    desc "Run Protos::Table and Phlex::Table memory benchmarks"
    task :table do
      Benchmark.memory do |x|
        x.report("Protos::Table") do
          ProtosTable.new.call
        end

        x.report("Phlex::Table") do
          PhlexTable.new.call
        end

        x.compare!
      end
    end
  end
end
