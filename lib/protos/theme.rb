# frozen_string_literal: true

module Protos
  class Theme
    # DOCS: A class that holds data for a theme. This class is used to safely
    # merge in user supplied css classes into a default theme.
    # This is the object that is returned by `css` and used to set slots for
    # a component style.

    class << self
      def merger
        @merger ||= TailwindMerge::Merger.new
      end
    end

    def initialize(theme = {}, **kwargs)
      @theme = theme.merge(kwargs)
    end

    def [](key)
      value = @theme[key]
      return value unless value.is_a?(String)

      self.class.merger.merge(value)
    end

    def key?(key)
      @theme.key?(key)
    end

    def add(key, value)
      TokenList.new
        .add(@theme.fetch(key, ""))
        .add(value)
        .to_s
        .tap do |tokens|
          @theme[key] = tokens
        end
    end

    def remove(key, value)
      TokenList.new
        .add(@theme.fetch(key, ""))
        .remove(value)
        .to_s
        .tap do |tokens|
          @theme[key] = tokens
        end
    end

    def set(key, value)
      if value.is_a?(Hash)
        @theme[key] = value
      else
        TokenList
          .parse(value)
          .to_s
          .tap do |tokens|
            @theme[key] = tokens
          end
      end
    end

    def merge(hash)
      hash ||= {}

      tap do
        hash.each_key do |key|
          if key?(key)
            add(key, hash[key])
          elsif negation?(key)
            no_bang = key.to_s[1..].to_sym
            remove(no_bang, hash[key])
          elsif override?(key)
            no_bang = key.to_s.chomp("!").to_sym
            set(no_bang, hash[key])
          else
            set(key, hash[key])
          end
        end
      end
    end

    private

    def negation?(key)
      key.to_s.start_with?("!")
    end

    def override?(key)
      key.to_s.end_with?("!")
    end
  end
end
