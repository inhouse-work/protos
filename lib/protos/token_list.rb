# frozen_string_literal: true

module Protos
  # A list of utility tokens that can handle parsing and merging sets of
  # tokens together safely.
  class TokenList
    attr_reader :tokens

    autoload :Tokens, "protos/token_list/tokens"

    def initialize(tokens = [])
      @tokens = Tokens.new(tokens)
    end

    def empty? = @tokens.empty?
    def to_s = @tokens.join(" ")

    # @param tokens [String,Array<String>]
    def remove(tokens)
      @tokens.subtract(parse(tokens))
      self
    end

    # @param tokens [String,Array<String>]
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
      case tokens
      when Array then tokens.flatten
      when String then tokens.split
      else
        raise ArgumentError, "Invalid tokens: #{tokens}, must be either " \
                             "String or an Array"
      end
    end
  end
end
