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
      @should_merge = tailwind_merge

      @theme = Hash.new do |hash, key|
        hash[key] = TokenList.new
      end

      return if kwargs.empty? && theme.empty?

      theme.merge!(kwargs).each do |key, value|
        @theme[key].add(value)
      end
    end

    # Key can be a symbol or string, they will be merged together for the final
    # css class.
    # - A symbol will be used to fetch a `TokenList` from the theme at that key.
    # - A string is used as a plain css value
    def [](*keys)
      symbols, strings = keys.partition { |key| key.instance_of?(Symbol) }
      values = @theme.values_at(*symbols).map!(&:to_s).reject(&:empty?)
      values.concat(strings) unless strings.empty?

      return nil if values.empty?
      return values unless @should_merge

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
      token_list = @theme[key].remove(value)
      @theme.delete(key) if token_list.empty?
    end

    def set(key, value)
      return if value.nil?

      if @theme.key?(key)
        @theme[key].clear.add(value)
      else
        @theme[key].add(value)
      end
    end

    def merge(hash)
      return self unless hash

      hash.each do |key, value|
        next add(key, value) if key?(key.to_sym)
        # Handle negation
        next remove(key[1..].to_sym, value) if key.start_with?("!")
        # handle override
        next set(key[..-2].to_sym, value) if key.end_with?("!")

        set(key.to_sym, value)
      end

      self
    end
  end
end
