# frozen_string_literal: true

module Protos
  class Timeline < Component
    # DOCS: A timeline component
    # https://daisyui.com/components/timeline/

    option :vertical, type: Types::Bool, default: -> { false }

    def view_template(&block)
      ul(**attrs, &block)
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
