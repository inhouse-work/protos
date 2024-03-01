# frozen_string_literal: true

module Protos
  class Timeline < Component
    option :vertical, type: Types::Bool, default: -> { false }

    def template(&block)
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

    def css
      {
        container: tokens(
          "timeline",
          vertical: "timeline-vertical"
        )
      }
    end
  end
end
