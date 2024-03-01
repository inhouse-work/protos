# frozen_string_literal: true

module Protos
  class Popover < Component
    # DOCS: Like a dropdown, but instead of a list of menu items, its just
    # a rendered block

    PositionTypes = Types::Coercible::Symbol.enum(
      :top,
      :bottom,
      :left,
      :right,
      :start,
      :end
    )

    option :position,
           type: PositionTypes,
           default: -> { :bottom },
           reader: false
    option :hover, type: Types::Bool, default: -> { false }

    def template(&block)
      details(**attrs, &block)
    end

    def content(...)
      Content.new(...)
    end

    def trigger(...)
      Trigger.new(...)
    end

    private

    def position
      {
        bottom: "dropdown-bottom",
        top: "dropdown-top",
        left: "dropdown-left",
        right: "dropdown-right",
        end: "dropdown-end",
        start: "dropdown-start"
      }.fetch(@position)
    end

    def theme
      {
        container: tokens("dropdown", position)
      }
    end
  end
end
