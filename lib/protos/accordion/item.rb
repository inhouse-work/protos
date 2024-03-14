# frozen_string_literal: true

module Protos
  class Accordion
    class Item < Component
      # DOCS: An accorion is just a collapse with radio buttons.

      option :id, type: Types::Coercible::String

      def template(&block)
        li(**attrs) do
          render collapse_component do
            # form: "" prevents the radio button from being submitted if its
            # within a form
            input(type: :radio, name: id, form: "")
            yield if block
          end
        end
      end

      private

      def collapse_component
        collapse_theme = { "!container": tokens("bg-base-100") }
        collapse_theme[:container!] = css[:collapse] if css[:collapse]

        Collapse.new(theme: collapse_theme)
      end

      def theme
        {
          container: tokens("join-item")
        }
      end
    end
  end
end
