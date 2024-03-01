# frozen_string_literal: true

module Protos
  class Modal
    class CloseButton < Component
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
