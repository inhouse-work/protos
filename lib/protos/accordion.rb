# frozen_string_literal: true

module Protos
  class Accordion < Component
    # DOCS: The accordion component. Accordion is a collapse with radio buttons.
    # Only one item can be open at a time. If you want to allow multiple items
    # to be open at the same time, use the collapse component.
    # https://daisyui.com/components/accordion/

    option :id,
           default: -> { "collapse-#{SecureRandom.hex(4)}" }

    def view_template(&)
      ul(**attrs, &)
    end

    def item(*, **, &) = render Item.new(*, id:, **, &)

    def content(...) = render Collapse::Content.new(...)

    def title(*, **, &)
      render Collapse::Title.new(*, id:, **, &)
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
