# frozen_string_literal: true

module Protos
  class Command
    class Trigger < Component
      # DOCS: A trigger is a button that opens a command palette modal

      def view_template(&block)
        button(**attrs, &block)
      end

      private

      def default_attrs
        {
          data: { action: "protos--modal#open" }
        }
      end
    end
  end
end
