# frozen_string_literal: true

module Protos
  class Menu < Component
    # DOCS: A menu of links or actions.
    # https://daisyui.com/components/menu/

    Direction = Types::Coercible::Symbol.enum(:vertical, :horizontal)
    Size = Types::Coercible::Symbol.enum(:xs, :sm, :md, :lg, :xl)

    DIRECTIONS = {
      vertical: "",
      horizontal: "menu-horizontal"
    }.freeze

    SIZES = {
      xs: "menu-xs",
      sm: "menu-sm",
      md: "menu-md",
      lg: "menu-lg",
      xl: "menu-xl"
    }.freeze

    autoload :Item, "protos/menu/item"

    option :size,
      type: Size,
      default: -> { :md },
      reader: :private

    option :direction,
      type: Direction,
      default: -> { :vertical },
      reader: :private

    def view_template(&)
      ul(**attrs, &)
    end

    def item(...)
      render Item.new(...)
    end

    private

    def theme
      {
        container: [
          "menu",
          DIRECTIONS[direction],
          SIZES[size]
        ]
      }
    end
  end
end
