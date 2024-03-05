module Protos
  class Toast
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
