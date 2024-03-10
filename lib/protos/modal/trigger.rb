# frozen_string_literal: true

module Protos
  class Modal
    class Trigger < Component
      # DOCS: A trigger is a button that opens a modal

      def template(&block)
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
