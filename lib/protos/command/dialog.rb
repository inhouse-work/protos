# frozen_string_literal: true

module Protos
  class Command
    class Dialog < Component
      # DOCS: The dialog for a command wraps the command content and provides a
      # modal backdrop for the command when it is opened.

      def view_template(&block)
        dialog(**attrs) do
          div(class: css[:modal], &block)
          form(method: :dialog, class: css[:form]) do
            button { "close" }
          end
        end
      end

      private

      def default_attrs
        {
          data: { "protos--modal-target": "modal" }
        }
      end

      def theme
        {
          container: %w[
            modal
            modal-bottom
            backdrop-blur-sm
            sm:modal-middle
          ],
          modal: "modal-box p-0",
          form: "modal-backdrop"
        }
      end
    end
  end
end
