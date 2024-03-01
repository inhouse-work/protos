# frozen_string_literal: true

module Protos
  class Modal
    class Dialog < Component
      def template(&block)
        dialog(**attrs) do
          div(class: css[:modal], &block)
        end
      end

      private

      def theme
        {
          container: tokens("modal", "modal-bottom", "sm:modal-middle"),
          modal: tokens("modal-box", "flex", "flex-col", "gap-xs")
        }
      end

      def attrs
        @attrs ||= build_attrs(
          {
            data: { "protos--modal-target": "modal" }
          }
        )
      end
    end
  end
end
