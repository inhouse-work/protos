# frozen_string_literal: true

module Protos
  class TokenList
    # DOCS: A list of utility tokens that can handle parsing and merging sets of
    # tokens together safely.

    attr_reader :tokens

    def initialize(tokens = [])
      @tokens = Set.new(tokens)
    end

    def empty?
      @tokens.empty?
    end

    def to_s
      @tokens.join(" ")
    end

    def remove(tokens)
      @tokens.subtract(parse(tokens))
      self
    end

    def add(tokens)
      @tokens.merge(parse(tokens))
      self
    end

    def clear
      @tokens.clear
      self
    end

    private

    def parse(tokens)
      tokens.split
    end
  end
end
