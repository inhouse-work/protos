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
        theme = Protos::Theme.new(foo: "bar")

        x.report("Protos::Theme initialization") do
          Protos::Theme.new({ foo: "bar" }, baz: "quix")
        end

        x.report("Protos::Theme#[]") do
          theme[:foo]
        end

        x.report("Protos::Theme#merge") do
          theme.merge(foo: "baz", foo!: "quix")
        end
      end
    end

    desc "Run Protos::Attributes ips benchmarks"
    task :attributes do
      Benchmark.ips do |x|
        attributes = Protos::Attributes.new(data: { controller: "foo" })

        x.report("Protos::Attributes initialization") do
          Protos::Attributes.new({ data: { controller: "foo" } }, bar: "baz")
        end

        x.report("Protos::Attributes#[]") do
          attributes[:data]
        end

        x.report("Protos::Attributes#merge") do
          attributes.merge(data: { controller: "bar" })
        end
      end
    end

    desc "Run Protos::Theme#[] with and without tailwind_merge"
    task :tailwind_merge do
      Benchmark.ips do |x|
        with_merge = Protos::Theme.new(foo: "p-2 p-4", tailwind_merge: true)
        without_merge = Protos::Theme.new(foo: "p-2 p-4", tailwind_merge: false)

        x.report("Protos::Theme#[] with merge") do
          with_merge[:foo]
        end

        x.report("Protos::Theme#[] without merge") do
          without_merge[:foo]
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

    desc "Run Protos::Theme memory benchmarks"
    task :theme do
      Benchmark.memory do |x|
        theme = Protos::Theme.new(foo: "bar")

        x.report("Protos::Theme initialization") do
          Protos::Theme.new({ foo: "bar" }, baz: "quix")
        end

        x.report("Protos::Theme#[]") do
          theme[:foo]
        end

        x.report("Protos::Theme#merge") do
          theme.merge(foo: "baz", foo!: "quix")
        end
      end
    end

    desc "Run Protos::Attributes memory benchmarks"
    task :attributes do
      Benchmark.memory do |x|
        attributes = Protos::Attributes.new(data: { controller: "foo" })

        x.report("Protos::Attributes initialization") do
          Protos::Attributes.new({ data: { controller: "foo" } }, bar: "baz")
        end

        x.report("Protos::Attributes#[]") do
          attributes[:data]
        end

        x.report("Protos::Attributes#merge") do
          attributes.merge(data: { controller: "bar" })
        end
      end
    end
  end
end
