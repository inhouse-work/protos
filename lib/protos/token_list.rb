# frozen_string_literal: true

module Protos
  class TokenList
    # DOCS: A list of utility tokens that can handle parsing and merging sets of
    # tokens together safely.

    def self.parse(input)
      case input
      when String then new(input.split)
      when Array then new(input)
      when TokenList then input
      when NilClass then new
      else raise ArgumentError,
                 "Invalid input for #{self.class.name}: #{input.inspect}"
      end
    end

    attr_reader :tokens

    def initialize(tokens = [])
      @tokens = Set.new(tokens)
    end

    def to_s
      @tokens.join(" ")
    end

    def remove(tokens)
      parse(tokens).each { |token| @tokens.delete(token) }
    end

    def add(tokens)
      parse(tokens).each { |token| @tokens.add(token) }
    end

    def clear
      @tokens.clear
    end

    private

    def parse(tokens)
      tokens.split.map!(&:strip)
    end
  end
end
