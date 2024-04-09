# frozen_string_literal: true

module Protos
  class ChatBubble
    class Footer < Component
      # DOCS: The footer of a chat bubble

      def view_template(&)
        div(**attrs, &)
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
