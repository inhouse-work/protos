# frozen_string_literal: true

module Protos
  class Timeline < Component
    # DOCS: A timeline component
    # https://daisyui.com/components/timeline/

    option :vertical, type: Types::Bool, default: -> { false }

    def view_template(&block)
      ul(**attrs, &block)
    end

    def item(...)
      Item.new(...)
    end

    def left(...)
      Left.new(...)
    end

    def center(...)
      Center.new(...)
    end

    def right(...)
      Right.new(...)
    end

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
