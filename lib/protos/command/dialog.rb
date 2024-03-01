# frozen_string_literal: true

module Protos
  class Command
    class Dialog < Component
      def template(&block)
        dialog(**attrs) do
          div(class: css[:modal], &block)
          form(method: :dialog, class: css[:form]) do
            button { "close" }
          end
        end
      end

      private

      def attrs
        @attrs ||= build_attrs(
          data: { "protos--modal-target": "modal" }
        )
      end

      def css
        @css ||= build_theme(
          container: tokens("modal", "modal-bottom", "sm:modal-middle"),
          modal: tokens("modal-box", "p-0"),
          form: tokens("modal-backdrop")
        )
      end
    end
  end
end
