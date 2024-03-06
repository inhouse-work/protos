# frozen_string_literal: true

module Protos
  class TokenList
    def self.parse(input)
      case input
      when String then new(input.split)
      when Array then new(input)
      else raise ArgumentError, "Invalid input: #{input.inspect}"
      end
    end

    attr_reader :tokens

    def initialize(tokens = [])
      @tokens = Set.new(tokens)
    end

    def to_s
      @tokens.to_a.join(" ")
    end

    def -(other)
      other = TokenList.parse(other) unless other.is_a?(TokenList)
      self.class.new(@tokens - other.tokens)
    end

    def +(other)
      other = TokenList.parse(other) unless other.is_a?(TokenList)
      self.class.new(@tokens + other.tokens)
    end

    def remove(token)
      tap do
        self.class.parse(token).tokens.each do |token|
          @tokens.delete(token)
        end
      end
    end

    def add(input)
      tap do
        self.class.parse(input).tokens.each do |token|
          @tokens.add(token)
        end
      end
    end
  end
end
