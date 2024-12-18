# frozen_string_literal: true

module Protos
  class Modal
    class CloseButton < Component
      # DOCS: A close button for a modal

      def view_template(&block)
        form(method: :dialog, class: css[:form]) do
          button(**attrs, &block)
        end
      end

      private

      def default_attrs
        {
          data: { action: "protos--modal#close" }
        }
      end
    end
  end
end
