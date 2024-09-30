# frozen_string_literal: true

module Protos
  class Timeline < Component
    # DOCS: A timeline component
    # https://daisyui.com/components/timeline/

    autoload :Item, "protos/timeline/item"
    autoload :Left, "protos/timeline/left"
    autoload :Center, "protos/timeline/center"
    autoload :Right, "protos/timeline/right"

    option :vertical, type: Types::Bool, default: -> { false }

    def view_template(&)
      ul(**attrs, &)
    end

    def item(...) = render Item.new(...)

    def left(...) = render Left.new(...)

    def center(...) = render Center.new(...)

    def right(...) = render Right.new(...)

    private

    def theme
      {
        container: tokens(
          "timeline",
          vertical: "timeline-vertical"
        )
      }
    end
  end
end
