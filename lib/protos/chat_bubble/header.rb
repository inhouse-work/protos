# frozen_string_literal: true

module Protos
  class ChatBubble
    class Header < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("chat-header")
        }
      end
    end
  end
end
