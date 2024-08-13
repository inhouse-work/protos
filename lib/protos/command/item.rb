# frozen_string_literal: true

module Protos
  class Command
    class Item < Component
      # DOCS: A single option within a command

      def view_template(&)
        li(**attrs, &)
      end

      private

      def default_attrs
        {
          data: {
            "protos--command-target": "item",
            action: "turbo:submit-end->protos--modal#handleFormSubmit"
          }
        }
      end
    end
  end
end
