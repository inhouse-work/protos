# frozen_string_literal: true

module Protos
  class ChatBubble
    # The header of a chat bubble. This is typically used to display the
    # name of the user who sent the message.
    class Header < Component

      # Renders the chat bubble header element.
      #
      # @yield The content block for the header content (sender name, etc.).
      # @return [nil] outputs to the @buffer
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "chat-header"
        }
      end
    end
  end
end
