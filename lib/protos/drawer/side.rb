# frozen_string_literal: true

module Protos
  class Drawer
    class Side < Component
      option :id, type: Types::Coercible::String

      def template
        aside(**attrs) do
          label(for: id, aria_label: "close sidebar", class: css[:toggle])
          yield if block_given?
        end
      end

      private

      def css
        @css ||= build_theme(
          container: tokens("drawer-side"),
          toggle: tokens("drawer-overlay")
        )
      end
    end
  end
end
