# frozen_string_literal: true

module Protos
  class ChatBubble
    class Image < Component
      # DOCS: An image within a chat bubble. This would typically be an avatar
      # component.

      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("chat-image")
        }
      end
    end
  end
end
