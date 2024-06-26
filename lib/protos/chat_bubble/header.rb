# frozen_string_literal: true

module Protos
  class ChatBubble
    class Header < Component
      # DOCS: The header of a chat bubble. This is typically used to display the
      # name of the user who sent the message.

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
