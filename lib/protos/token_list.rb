# frozen_string_literal: true

module Protos
  class TokenList
    # DOCS: A list of utility tokens that can handle parsing and merging sets of
    # tokens together safely.

    attr_reader :tokens

    def initialize(tokens = [])
      @tokens = Set.new(tokens)
    end

    def to_s
      @tokens.join(" ")
    end

    def remove(tokens)
      tap { @tokens.subtract(parse(tokens)) }
    end

    def add(tokens)
      tap { @tokens.merge(parse(tokens)) }
    end

    def clear
      tap { @tokens.clear }
    end

    private

    def parse(tokens)
      tokens.split
    end
  end
end
