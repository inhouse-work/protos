# frozen_string_literal: true

module Protos
  class Modal
    class Dialog < Component
      # DOCS: A modal dialog. This is the place for the main content of the
      # modal that will be displayed when the trigger is clicked.

      def view_template(&block)
        dialog(**attrs) do
          div(class: css[:modal], &block)
        end
      end

      private

      def default_attrs
        {
          data: { "protos--modal-target": "dialog" }
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
          modal: %w[
            modal-box
            flex
            flex-col
            gap-xs
          ]
        }
      end
    end
  end
end
