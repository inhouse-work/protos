# frozen_string_literal: true

module Protos
  # A class that holds data for a theme. This class is used to safely
  # merge in user supplied css classes into a default theme.
  # This is the object that is returned by `css` and used to set slots for
  # a component style.
  class Theme
    autoload :Fast, "protos/theme/fast"

    class << self
      def merger
        # This could be a class variable to save memory for subclasses being
        # used along side this class, but seeing as how its an
        # internal class I don't see much benefit at the moment.
        @merger ||= TailwindMerge.new
      end
    end

    # @param theme [Hash{Symbol=>String,Array<String>}]
    # @param tailwind_merge [Boolean] Whether or not to use tailwind-merge
    def initialize(theme = {}, tailwind_merge: true, **kwargs)
      @should_merge = tailwind_merge
      @cache = {}

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
    #
    # - A symbol will be used to fetch a `TokenList` from the theme at that key.
    # - A string is used as a plain css value
    #
    # @param keys [Array<Symbol,String>]
    # @return [String, nil]
    def [](*keys)
      # Performance optimization: Use the cache for a single key, but not for
      # multiple keys to be economical. The cache is cleared when the theme
      # is modified.
      if keys.length == 1
        key = keys.first
        return @cache.fetch(key) { @cache[key] = resolve_key(key) }
      end

      resolve_keys(keys)
    end

    # @param key [Symbol]
    # @return [Boolean]
    def key?(key) = @theme.key?(key)

    # @param key [Symbol]
    # @param value [String,Array<String>]
    # @return [void]
    def add(key, value)
      return if value.nil?

      @theme[key].add(value)
      @cache.clear
    end

    # @param key [Symbol]
    # @param value [String,Array<String>]
    # @return [void]
    def remove(key, value)
      return unless @theme.key?(key)

      token_list = @theme[key].remove(value)
      @theme.delete(key) if token_list.empty?
      @cache.clear
    end

    # @param key [Symbol]
    # @param value [String,Array<String>]
    # @return [void]
    def set(key, value)
      return if value.nil?

      if @theme.key?(key)
        @theme[key].clear.add(value)
      else
        @theme[key].add(value)
      end

      @cache.clear
    end

    # @param hash [Hash{Symbol=>String,Array<String>}]
    # @return [Theme]
    def merge(hash)
      return self if hash.nil?

      hash.each do |key, value|
        next if value.nil?

        case key
        when /\A!(.+)\z/ # Negation
          remove(Regexp.last_match(1).to_sym, value)
        when /\A(.+)!+\z/ # Override
          set(Regexp.last_match(1).to_sym, value)
        else
          add(key.to_sym, value)
        end
      end

      self
    end

    private

    def resolve_keys(keys)
      symbols, strings = keys.partition { |key| key.instance_of?(Symbol) }
      values = @theme.values_at(*symbols).map!(&:to_s)
      values.reject!(&:empty?)
      values.concat(strings)
      resolve_values(values)
    end

    def resolve_values(values)
      return nil if values.empty?
      return values unless @should_merge
      return values.first if values.length == 1 && !merge?(values.first)

      self.class.merger.merge(values)
    end

    def resolve_key(key)
      value = key.instance_of?(Symbol) ? theme_value(key) : key.to_s

      return nil if value.empty?
      return [value] unless @should_merge
      return value unless merge?(value)

      self.class.merger.merge(value)
    end

    def theme_value(key)
      token_list = @theme.fetch(key, nil)
      token_list ? token_list.to_s : ""
    end

    # Performance optimization: A single class can't conflict with anything,
    # so tailwind-merge would just return it unchanged.
    def merge?(value) = value.match?(/\s/)
  end
end
