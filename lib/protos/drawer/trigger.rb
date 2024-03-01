# frozen_string_literal: true

module Protos
  class Drawer
    class Trigger < Component
      option :id, type: Types::Coercible::String

      def template(&block)
        label(for: id, **attrs, &block)
      end

      private

      def css
        @css ||= build_theme(
          container: tokens("drawer-button")
        )
      end
    end
  end
end
