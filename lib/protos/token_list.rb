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

    def initialize(tokens)
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
      @tokens.delete(token)
    end

    def add(token)
      @tokens.add(token)
    end
  end
end
