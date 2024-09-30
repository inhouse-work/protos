# frozen_string_literal: true

module Protos
  class Accordion < Component
    # DOCS: The accordion component. Accordion is a collapse with radio buttons.
    # Only one item can be open at a time. If you want to allow multiple items
    # to be open at the same time, use the collapse component.
    # https://daisyui.com/components/accordion/

    autoload :Item, "protos/accordion/item"

    def view_template(&)
      ul(**attrs, &)
    end

    def item(*, input_id: nil, **, &)
      self.current_input_id = input_id

      render Item.new(*, input_id: current_input_id, **, &)
    end

    def content(...) = render Collapse::Content.new(...)

    def title(*, **, &)
      render Collapse::Title.new(*, input_id: current_input_id, **, &)
    end

    private

    attr_reader :current_input_id

    def current_input_id=(value)
      @current_input_id = value || "collapse-#{SecureRandom.hex(4)}"
    end

    def theme
      {
        container: "join join-vertical"
      }
    end
  end
end
