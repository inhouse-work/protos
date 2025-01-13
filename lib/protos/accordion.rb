# frozen_string_literal: true

module Protos
  class Accordion < Component
    # DOCS: The accordion component. Accordion is a collapse with radio buttons.
    # Only one item can be open at a time. If you want to allow multiple items
    # to be open at the same time, use the collapse component.
    # https://daisyui.com/components/accordion/

    autoload :Item, "protos/accordion/item"

    option :input_name,
      default: -> { "accordion-#{SecureRandom.hex(4)}" },
      reader: false,
      type: Types::String

    def view_template(&)
      ul(**attrs, &)
    end

    def item(*, **, &)
      render Item.new(*, input_name: @input_name, **, &)
    end

    def content(...) = render Collapse::Content.new(...)

    def title(*, **, &)
      render Collapse::Title.new(*, input_id: @input_name, **, &)
    end

    private

    def theme
      {
        container: "join join-vertical"
      }
    end
  end
end
