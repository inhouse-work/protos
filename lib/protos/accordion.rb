# frozen_string_literal: true

module Protos
  class Accordion < Component
    # DOCS: The accordion component. Accordion is a collapse with radio buttons.
    # Only one item can be open at a time. If you want to allow multiple items
    # to be open at the same time, use the collapse component.
    # https://daisyui.com/components/accordion/

    option :id, default: -> { SecureRandom.uuid }

    def template(&block)
      ul(**attrs, &block)
    end

    def item(**kwargs)
      Item.new(id:, **kwargs)
    end

    def title(...)
      Collapse::Title.new(...)
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
