# frozen_string_literal: true

module Protos
  class ChatBubble
    # The main content of a chat bubble. This would normally be the text
    # content of the message. It will be colored according to the type.
    class Content < Component
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

      # @!attribute [r] type
      # @return [Types::Colors] The color/style of the chat bubble content.
      option :type,
        default: -> { :default },
        type: Types::Colors

      # Renders the chat bubble content element.
      #
      # @yield The content block for the message text.
      # @return [nil] outputs to the @buffer
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
