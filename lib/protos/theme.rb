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
      @theme = Hash.new do |hash, key|
        hash[key] = TokenList.new
      end

      theme.merge(kwargs).each do |key, value|
        @theme[key].add(value)
      end
    end

    def [](key)
      return nil unless key?(key)

      @theme[key].to_s
    end

    def key?(key)
      @theme.key?(key)
    end

    def add(key, value, merge: false)
      value = self.class.merger.merge(value) if merge
      @theme[key].add(value)
    end

    def remove(key, value)
      @theme[key].remove(value)
    end

    def set(key, value)
      @theme[key].clear
      @theme[key].add(value)
    end

    def merge(hash)
      hash ||= {}

      tap do
        hash.each_key do |key|
          if key?(key)
            add(key, hash[key], merge: true)
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
