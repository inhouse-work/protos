# frozen_string_literal: true

module Protos
  class Theme
    # A lightweight theme used when a component has no user-supplied theme or
    # class overrides. It resolves slot values directly instead of building a
    # `TokenList` for every slot, while still using tailwind-merge to resolve
    # conflicting classes. This is tolerated for performance reasons.
    class Fast
      # @param theme [Hash{Symbol=>String,Array<String>}]
      def initialize(theme)
        @theme = theme
      end

      # @param keys [Array<Symbol,String>]
      # @return [String, nil]
      def [](*keys)
        return resolve_key(keys.first) if keys.length == 1

        values = []
        keys.each do |key|
          value = key.instance_of?(Symbol) ? resolve(key) : key.to_s
          values << value unless value.empty?
        end

        return nil if values.empty?
        return values.first if values.length == 1 && !merge?(values.first)

        Theme.merger.merge(values)
      end

      # @param key [Symbol]
      # @return [Boolean]
      def key?(key) = @theme.key?(key)

      private

      def resolve_key(key)
        value = key.instance_of?(Symbol) ? resolve(key) : key.to_s
        return nil if value.empty?
        return value unless merge?(value)

        Theme.merger.merge(value)
      end

      def resolve(key)
        value = @theme[key]
        value.is_a?(Array) ? value.join(" ") : value.to_s
      end

      # A single class can't conflict with anything, so tailwind-merge would
      # just return it unchanged. Skipping it avoids the merge and its cache
      # lookup entirely for leaf components (cells, badges, buttons, etc.).
      def merge?(value)
        value.match?(/\s/)
      end
    end
  end
end
