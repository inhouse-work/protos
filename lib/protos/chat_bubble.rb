# frozen_string_literal: true

module Protos
  class ChatBubble < Component
    # DOCS: A chat bubble component that contains a message an possibly some
    # metadata and an image. Each chat bubble would represent a single message
    # in a larger chat history.
    # https://daisyui.com/components/chat/

    autoload :Content, "protos/chat_bubble/content"
    autoload :Image, "protos/chat_bubble/image"
    autoload :Header, "protos/chat_bubble/header"
    autoload :Footer, "protos/chat_bubble/footer"

    Positions = Types::Coercible::Symbol.enum(
      :start,
      :end
    )

    ALIGNMENTS = {
      start: "chat-start",
      end: "chat-end"
    }.freeze

    option :align,
      default: -> { :start },
      reader: false,
      type: Positions

    def view_template(&)
      div(**attrs, &)
    end

    def content(...) = render Content.new(...)

    def footer(...) = render Footer.new(...)

    def header(...) = render Header.new(...)

    def image(...) = render Image.new(...)

    private

    def align
      ALIGNMENTS.fetch(@align)
    end

    def theme
      {
        container: %W[
          chat
          #{align}
        ]
      }
    end
  end
end
