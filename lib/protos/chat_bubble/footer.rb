# frozen_string_literal: true

module Protos
  class ChatBubble
    class Footer < Component
      # DOCS: The footer of a chat bubble

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
