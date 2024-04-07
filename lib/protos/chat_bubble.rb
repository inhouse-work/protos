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

    def view_template(&block)
      div(**attrs, &block)
    end

    def content(...)
      Content.new(...)
    end

    def footer(...)
      Footer.new(...)
    end

    def header(...)
      Header.new(...)
    end

    def image(...)
      Image.new(...)
    end

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
