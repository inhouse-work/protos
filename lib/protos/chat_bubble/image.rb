# frozen_string_literal: true

module Protos
  class ChatBubble
    # An image within a chat bubble. This would typically be an avatar
    # component.
    class Image < Component
      # Renders the chat bubble image element.
      #
      # @yield The content block for the image content (avatar, etc.).
      # @return [nil] outputs to the @buffer
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
