# frozen_string_literal: true

module Protos
  class ChatBubble
    # The footer of a chat bubble
    class Footer < Component

      # Renders the chat bubble footer element.
      #
      # @yield The content block for the footer content (timestamp, status, etc.).
      # @return [nil] outputs to the @buffer
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "chat-footer"
        }
      end
    end
  end
end
