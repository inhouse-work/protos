# frozen_string_literal: true

module Protos
  class Toast
    class CloseButton < Component
      def template(&block)
        form(method: :dialog, class: css[:form]) do
          button(
            autofocus: true,
            formmethod: :dialog,
            **attrs,
            &block
          )
        end
      end
    end
  end
end
