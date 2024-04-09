# frozen_string_literal: true

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

    desc "Run Protos::Theme ips benchmarks"
    task :theme do
      Benchmark.ips do |x|
        x.report("Protos::Theme initialization") do
          Protos::Theme.new({ foo: "bar" }, baz: "quix")
        end

        x.report("Protos::Theme#[]") do
          Protos::Theme.new(foo: "bar")[:foo]
        end

        x.report("Protos::Theme#merge") do
          Protos::Theme.new(foo: "bar").merge(foo: "baz", foo!: "quix")
        end
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

    desc "Run Protos::Theme memory benchmarks"
    task :theme do
      Benchmark.memory do |x|
        x.report("Protos::Theme initialization") do
          Protos::Theme.new({ foo: "bar" }, baz: "quix")
        end
      end
    end
  end
end
