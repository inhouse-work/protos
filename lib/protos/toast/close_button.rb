# frozen_string_literal: true

module Protos
  class Toast
    class CloseButton < Component
      # DOCS: A close button for a toast

      def view_template(&block)
        form(method: :dialog, class: css[:form]) do
          button(
            autofocus: true,
            formmethod: :dialog,
            formnovalidate: true,
            **attrs,
            &block
          )
        end
      end

      private

      def theme
        {
          # NOTE: Added this because I'm noticing the form having a margin
          # with a default setup. Not sure if this is really needed.
          form: "m-0"
        }
      end
    end
  end
end
