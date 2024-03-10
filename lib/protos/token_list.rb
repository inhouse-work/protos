# frozen_string_literal: true

module Protos
  class TokenList
    # DOCS: A list of utility tokens that can handle parsing and merging sets of
    # tokens together safely. It uses TailwindMerge to merge the tokens together
    # while accounting for their conflicts.

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
      merge(@tokens.to_a.join(" "))
    end

    def -(other)
      other = TokenList.parse(other)
      self.class.new(@tokens - other.tokens)
    end

    def +(other)
      other = TokenList.parse(other)
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

    private

    def merge(tokens)
      TailwindMerge::Merger.new(
        config: {
          theme: {
            # Not currently working in the gem.
            # "spacing" => %w[xs sm md lg xl],
            # "padding" => %w[xs sm md lg xl],
            # "margin" => %w[xs sm md lg xl]
          }
        }
      )
        .merge(tokens)
    end
  end
end
