# frozen_string_literal: true

module Protos
  class ChatBubble
    class Content < Component
      # DOCS: The main content of a chat bubble. This would normally be the text
      # content of the message. It will be colored according to the type.

      STYLES = {
        default: "",
        accent: "chat-bubble-accent",
        error: "chat-bubble-error",
        info: "chat-bubble-info",
        neutral: "chat-bubble-neutral",
        primary: "chat-bubble-primary",
        secondary: "chat-bubble-secondary",
        success: "chat-bubble-success",
        warning: "chat-bubble-warning"
      }.freeze

      option :type,
        default: -> { :default },
        reader: false,
        type: Types::Styles

      def view_template(&)
        div(**attrs, &)
      end

      private

      def style
        STYLES.fetch(@type)
      end

      def theme
        {
          container: %W[
            chat-bubble
            #{style}
          ]
        }
      end
    end
  end
end
