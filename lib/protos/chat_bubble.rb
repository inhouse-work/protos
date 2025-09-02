# frozen_string_literal: true

module Protos
  # A chat bubble component that contains a message and possibly some
  # metadata and an image. Each chat bubble would represent a single message
  # in a larger chat history.
  #
  # @see https://daisyui.com/components/chat/
  #
  # @example Basic chat bubble
  #   render Protos::ChatBubble.new(align: :start) do |chat|
  #     chat.image { avatar(src: "user.jpg") }
  #     chat.header { "John Doe" }
  #     chat.content { "Hello, how are you?" }
  #     chat.footer { "12:45 PM" }
  #   end
  #
  # @example Chat bubble with different alignment and styling
  #   render Protos::ChatBubble.new(align: :end) do |chat|
  #     chat.content(type: :primary) { "I'm doing great, thanks!" }
  #     chat.footer { "12:46 PM • Delivered" }
  #   end
  class ChatBubble < Component
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

    # @!attribute [r] align
    # @return [Positions]
    option :align,
      default: -> { :start },
      type: Positions

    # Renders the chat bubble container element.
    #
    # @yield The content block to define chat bubble parts.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      div(**attrs, &)
    end

    # Renders the chat bubble content (main message).
    #
    # @param (see Protos::ChatBubble::Content#initialize)
    # @return [nil]
    def content(...) = render Content.new(...)

    # Renders the chat bubble footer (timestamp, status, etc.).
    #
    # @param (see Protos::ChatBubble::Footer#initialize)
    # @return [nil]
    def footer(...) = render Footer.new(...)

    # Renders the chat bubble header (sender name, etc.).
    #
    # @param (see Protos::ChatBubble::Header#initialize)
    # @return [nil]
    def header(...) = render Header.new(...)

    # Renders the chat bubble image (avatar, etc.).
    #
    # @param (see Protos::ChatBubble::Image#initialize)
    # @return [nil]
    def image(...) = render Image.new(...)

    private

    def theme
      {
        container: [
          "chat",
          ALIGNMENTS.fetch(@align)
        ]
      }
    end
  end
end
