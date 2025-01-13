# frozen_string_literal: true

module Protos
  class ChatBubble
    class Content < Component
      # DOCS: The main content of a chat bubble. This would normally be the text
      # content of the message. It will be colored according to the type.

      STYLES = {
        none: "",
        primary: "chat-bubble-primary",
        secondary: "chat-bubble-secondary",
        accent: "chat-bubble-accent",
        info: "chat-bubble-info",
        success: "chat-bubble-success",
        warning: "chat-bubble-warning",
        error: "chat-bubble-error"
      }.freeze

      option :type,
        default: -> { :none },
        reader: false,
        type: Types::Coercible::Symbol.enum(
          :none,
          :primary,
          :secondary,
          :accent,
          :info,
          :success,
          :warning,
          :error
        )

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
