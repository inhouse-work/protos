# frozen_string_literal: true

module Protos
  class Modal
    class CloseButton < Component
      # DOCS: A close button for a modal

      def template(&block)
        form(method: :dialog, class: css[:form]) do
          button(
            **attrs,
            &block
          )
        end
      end
    end
  end
end
