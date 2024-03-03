# frozen_string_literal: true

module Protos
  class Theme
    def initialize(theme = {}, **kwargs)
      @theme = theme.merge(kwargs)
    end

    def [](key)
      @theme.fetch(key)
    end

    def merge(hash)
      hash ||= {}

      tap do
        hash.each_key do |key|
          if @theme.key?(key)
            @theme[key] = [@theme[key], hash[key]].flatten.compact.join(" ")
          elsif key.to_s.start_with?("!")
            no_bang = key.to_s[1..].to_sym
            tokens = @theme[no_bang].split
            removable_tokens = hash[key].split
            removable_tokens.each { |token| tokens.delete(token) }
            @theme[no_bang] = tokens.join(" ")
          elsif key.to_s.end_with?("!")
            no_bang = key.to_s.chomp("!").to_sym
            @theme[no_bang] = hash[key]
          else
            @theme[key] = hash[key]
          end
        end
      end
    end
  end
end
