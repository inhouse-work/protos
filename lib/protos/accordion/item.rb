# frozen_string_literal: true

module Protos
  class Accordion
    class Item < Component
      # DOCS: An accorion is just a collapse with radio buttons.

      option :id, type: Types::Coercible::String

      def view_template(&block)
        li(**attrs) do
          render Collapse.new(theme: collapse_theme) do
            # form: "" prevents the radio button from being submitted if its
            # within a form
            input(type: :radio, name: id, form: "", autocomplete: :off)
            yield if block
          end
        end
      end

      private

      def collapse_theme
        { "!container": "bg-base-100" }.tap do |theme|
          theme[:container!] = css[:collapse] if css[:collapse]
        end
      end

      def theme
        {
          container: "join-item"
        }
      end
    end
  end
end
