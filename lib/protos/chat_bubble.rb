# frozen_string_literal: true

module Protos
  class ChatBubble < Component
    option :align,
           default: -> { :start },
           reader: false,
           type: Types::Coercible::Symbol.enum(
             :start,
             :end
           )

    def template(&block)
      div(**attrs, &block)
    end

    def image(...)
      Image.new(...)
    end

    def header(...)
      Header.new(...)
    end

    def footer(...)
      Footer.new(...)
    end

    def content(...)
      Content.new(...)
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
