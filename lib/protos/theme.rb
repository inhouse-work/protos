# frozen_string_literal: true

module Protos
  class Theme
    # DOCS: A class that holds data for a theme. This class is used to safely
    # merge in user supplied css classes into a default theme.
    # This is the object that is returned by `css` and used to set slots for
    # a component style.

    class << self
      def merger
        # This could be a class variable to save memory for subclasses being
        # used along side this class, but seeing as how its an
        # internal class I don't see much benefit at the moment.
        @merger ||= TailwindMerge::Merger.new.freeze
      end
    end

    def initialize(theme = {}, tailwind_merge: true, **kwargs)
      @tailwind_merge = tailwind_merge

      @theme = Hash.new do |hash, key|
        hash[key] = TokenList.new
      end

      theme.merge!(kwargs).each do |key, value|
        @theme[key].add(value)
      end
    end

    def [](*keys)
      symbols, strings = keys.partition { |key| key.is_a?(Symbol) }
      values = @theme.values_at(*symbols).join(" ")
      values += " #{strings.join(" ")}" unless strings.empty?

      return nil if values.empty?
      return values unless @tailwind_merge

      self.class.merger.merge(values)
    end

    def key?(key)
      @theme.key?(key)
    end

    def add(key, value)
      return if value.nil?

      @theme[key].add(value)
    end

    def remove(key, value)
      @theme[key].remove(value)
      @theme.delete(key) if @theme[key].empty?
    end

    def set(key, value)
      return if value.nil?

      @theme[key].clear.add(value)
    end

    def merge(hash)
      return self unless hash

      hash.each do |key, value|
        if key?(key)
          add(key, value)
        elsif negation?(key)
          remove(key[1..].to_sym, value)
        elsif override?(key)
          set(key[..-2].to_sym, value)
        else
          set(key, value)
        end
      end

      self
    end

    private

    def negation?(key)
      key.start_with?("!")
    end

    def override?(key)
      key.end_with?("!")
    end
  end
end
