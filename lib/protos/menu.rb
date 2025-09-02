# frozen_string_literal: true

module Protos
  # A menu of links or actions
  #
  # @see https://daisyui.com/components/menu/
  #
  # @example Basic vertical menu
  #   render Protos::Menu.new(size: :lg) do |menu|
  #     menu.item { a(href: "/home") { "Home" } }
  #     menu.item { a(href: "/about") { "About" } }
  #     menu.item { a(href: "/contact") { "Contact" } }
  #   end
  #
  # @example Horizontal menu
  #   render Protos::Menu.new(direction: :horizontal, size: :md) do |menu|
  #     menu.item { a(href: "/dashboard") { "Dashboard" } }
  #     menu.item { a(href: "/settings") { "Settings" } }
  #     menu.item { a(href: "/logout") { "Logout" } }
  #   end
  class Menu < Component
    Directions = Types::Coercible::Symbol.enum(:vertical, :horizontal)
    Sizes = Types::Coercible::Symbol.enum(:xs, :sm, :md, :lg, :xl)

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

    # @!attribute [r] size
    # @return [Sizes]
    option :size,
      type: Sizes,
      default: -> { :md }

    # @!attribute [r] direction
    # @return [Direction]
    option :direction,
      type: Directions,
      default: -> { :vertical }

    # Renders the full menu element.
    #
    # @yield The content block to define menu items.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      ul(**attrs, &)
    end

    # Renders a menu item.
    #
    # @param (see Protos::Menu::Item#initialize)
    # @return [nil]
    def item(...)
      render Item.new(...)
    end

    private

    def theme
      {
        container: [
          "menu",
          DIRECTIONS.fetch(@direction),
          SIZES.fetch(@size)
        ]
      }
    end
  end
end
