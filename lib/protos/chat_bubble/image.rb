# frozen_string_literal: true

module Protos
  class ChatBubble
    class Image < Component
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
