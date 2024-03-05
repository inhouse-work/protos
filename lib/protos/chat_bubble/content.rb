# frozen_string_literal: true

module Protos
  class ChatBubble
    class Content < Component
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

      def template(&block)
        div(**attrs, &block)
      end

      private

      def type
        {
          none: "",
          primary: "chat-bubble-primary",
          secondary: "chat-bubble-secondary",
          accent: "chat-bubble-accent",
          info: "chat-bubble-info",
          success: "chat-bubble-success",
          warning: "chat-bubble-warning",
          error: "chat-bubble-error"
        }.fetch(@type)
      end

      def theme
        {
          container: tokens("chat-bubble", type)
        }
      end
    end
  end
end
