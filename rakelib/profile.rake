# frozen_string_literal: true

require "protos"
require "ruby-prof"
require "ruby-prof-speedscope"

require_relative "support/protos_table"
require_relative "support/phlex_table"

TMP_DIR = File.expand_path("../tmp", __dir__)
FileUtils.mkdir_p(TMP_DIR)

def output_result(result, name)
  flat_path       = File.join(TMP_DIR, "profile-#{name}-flat.txt")
  graph_path      = File.join(TMP_DIR, "profile-#{name}-graph.html")
  speedscope_path = File.join(TMP_DIR, "profile-#{name}-speedscope.json")

  File.open(flat_path, "w")       { |f| RubyProf::FlatPrinter.new(result).print(f) }
  File.open(graph_path, "w")      { |f| RubyProf::GraphHtmlPrinter.new(result).print(f) }
  File.open(speedscope_path, "w") { |f| RubyProf::SpeedscopePrinter.new(result).print(f) }

  puts "Profile results written to:"
  puts "  Flat:       #{flat_path}"
  puts "  Graph:      #{graph_path}"
  puts "  Speedscope: #{speedscope_path}"
  puts
  puts "Open #{speedscope_path} in https://www.speedscope.app"
end

namespace :profile do
  desc "Run Protos::Table and Phlex::Table profile"
  task :table do
    result = RubyProf::Profile.profile do
      100.times { ProtosTable.call }
    end

    output_result(result, "table")
  end

  desc "Run Protos::Mix profile"
  task :mix do
    random_hashes = Array.new(100) do
      { data: { controller: ("a".."z").to_a.sample(8).join } }
    end

    result = RubyProf::Profile.profile do
      random_hashes.each_cons(2) do |hash_a, hash_b|
        Protos::Mix.call(hash_a, hash_b)
      end
    end

    output_result(result, "mix")
  end

  desc "Run Protos::Attributes profile"
  task :attributes do
    attributes = Protos::Attributes.new(data: { controller: "foo" })

    result = RubyProf::Profile.profile do
      attributes.merge(data: { controller: "bar" })
    end

    output_result(result, "attributes")
  end
end
