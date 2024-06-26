# frozen_string_literal: true

module Protos
  class ChatBubble
    class Image < Component
      # DOCS: An image within a chat bubble. This would typically be an avatar
      # component.

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "chat-image"
        }
      end
    end
  end
end
