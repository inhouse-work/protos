# frozen_string_literal: true

module Protos
  class Alert
    class Icon < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def style
        {
          container: tokens("place-self-start", "mt-1")
        }
      end
    end
  end
end
