# frozen_string_literal: true

module Protos
  class Accordion
    class Item < Component
      option :id, type: Types::Coercible::String

      def template(&block)
        li(**attrs) do
          render collapse do |_collapse|
            input(type: :radio, name: id, id:)
            yield if block
          end
        end
      end

      private

      def collapse
        collapse_theme = { container!: css[:collapse] }
        Collapse.new(theme: collapse_theme)
      end

      def theme
        {
          container: tokens("join-item"),
          collapse: tokens("bg-transparent")
        }
      end
    end
  end
end
