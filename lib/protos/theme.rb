# frozen_string_literal: true

module Protos
  class Theme
    def initialize(theme = {}, **kwargs)
      @theme = theme.merge(kwargs)
    end

    def [](key)
      @theme[key]
    end

    def key?(key)
      @theme.key?(key)
    end

    def add(key, value)
      current_tokens = parse(@theme.fetch(key, ""))
      new_tokens = parse(value)
      tokens = current_tokens + new_tokens

      @theme[key] = tokens.to_s
    end

    def remove(key, value)
      current_tokens = parse(@theme.fetch(key, ""))
      removable_tokens = parse(value)
      tokens = current_tokens - removable_tokens

      @theme[key] = tokens.to_s
    end

    def set(key, value)
      if value.is_a?(Hash)
        @theme[key] = value
      else
        tokens = parse(value)
        @theme[key] = tokens.to_s
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

    def parse(value)
      TokenList.parse(value)
    end

    def negation?(key)
      key.to_s.start_with?("!")
    end

    def override?(key)
      key.to_s.end_with?("!")
    end
  end
end
