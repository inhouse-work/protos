# frozen_string_literal: true

module Protos
  class Modal
    class Trigger < Component
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
