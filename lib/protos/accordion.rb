# frozen_string_literal: true

module Protos
  class Accordion < Component
    # DOCS: The accordion component. Accordion is a collapse with radio buttons.
    # Only one item can be open at a time. If you want to allow multiple items
    # to be open at the same time, use the collapse component.
    # https://daisyui.com/components/accordion/

    option :id,
           default: -> { "collapse-#{SecureRandom.hex(4)}" }

    def view_template(&block)
      ul(**attrs, &block)
    end

    def item(**kwargs) = render Item.new(id:, **kwargs)

    def title(*args, **kwargs, &block)
      Collapse::Title.new(*args, id:, **kwargs, &block)
    end

    def content(...)
      Collapse::Content.new(...)
    end

    private

    def theme
      {
        container: tokens(
          "join",
          "join-vertical"
        )
      }
    end
  end
end
