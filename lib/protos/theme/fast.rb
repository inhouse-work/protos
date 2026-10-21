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
        values = []
        keys.each do |key|
          value = key.instance_of?(Symbol) ? resolve(key) : key.to_s
          values << value unless value.empty?
        end

        return nil if values.empty?

        Theme.merger.merge(values)
      end

      # @param key [Symbol]
      # @return [Boolean]
      def key?(key) = @theme.key?(key)

      private

      def resolve(key)
        value = @theme[key]
        value.is_a?(Array) ? value.join(" ") : value.to_s
      end
    end
  end
end
