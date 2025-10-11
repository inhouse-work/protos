# frozen_string_literal: true

module Protos
  class TokenList
    # This is used in place of a `Set` as a performance optimization.
    # Testing the memory and profiling the performance says that this is much
    # better
    class Tokens
      # @param tokens [Array<String>]
      def initialize(tokens)
        @tokens = Hash.new do |hash, key|
          hash[key] = true
        end

        tokens.each { @tokens[it] }
      end

      # @return [Boolean]
      def empty? = @tokens.empty?

      # @param separator [String]
      # @return [String]
      def join(separator)
        @tokens.keys.join(separator)
      end

      # @param other [Array<String>]
      # @return [void]
      def subtract(other)
        other.each { @tokens.delete(it) }
      end

      # @param other [Array<String>]
      # @return [void]
      def merge(other)
        other.each { @tokens[it] }
      end

      # @return [void]
      def clear
        @tokens.clear
      end
    end
  end
end
