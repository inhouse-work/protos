# frozen_string_literal: true

module Protos
  class ChatBubble
    class Footer < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("chat-footer")
        }
      end
    end
  end
end
