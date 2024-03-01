# frozen_string_literal: true

module Protos
  class Dropdown < Component
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

    def item(...)
      Item.new(...)
    end

    def menu(...)
      Menu.new(...)
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
        container: tokens(
          "dropdown",
          position,
          hover: "dropdown-hover"
        )
      }
    end
  end
end
