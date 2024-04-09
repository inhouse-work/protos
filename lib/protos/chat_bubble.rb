# frozen_string_literal: true

module Protos
  class ChatBubble < Component
    # DOCS: A chat bubble component that contains a message an possibly some
    # metadata and an image. Each chat bubble would represent a single message
    # in a larger chat history.
    # https://daisyui.com/components/chat/

    option :align,
           default: -> { :start },
           reader: false,
           type: Types::Coercible::Symbol.enum(
             :start,
             :end
           )

    def view_template(&)
      div(**attrs, &)
    end

    def content(...) = render Content.new(...)

    def footer(...) = render Footer.new(...)

    def header(...) = render Header.new(...)

    def image(...) = render Image.new(...)

    private

    def align
      {
        start: "chat-start",
        end: "chat-end"
      }.fetch(@align)
    end

    def theme
      {
        container: tokens("chat", align)
      }
    end
  end
end
