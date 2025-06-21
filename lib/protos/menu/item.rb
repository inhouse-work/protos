# frozen_string_literal: true

module Protos
  class Menu
    # A single item in a menu, typically containing a link or action.
    #
    # @see https://daisyui.com/components/menu/
    #
    # @example Basic menu item
    #   menu.item { a(href: "/home") { "Home" } }
    #
    # @example Menu title item
    #   menu.item(title: true) { "Categories" }
    #
    # @!attribute [r] title
    #   @return [Boolean] Whether this item should be styled as a section title
    class Item < Component
      option :title, type: Types::Bool, default: -> { false }

      # Renders the menu item element.
      #
      # @yield The content block to define the item's content
      # @return [nil] outputs to the @buffer
      def view_template(&)
        li(**attrs, &)
      end

      private

      def theme
        {
          container: [
            ("menu-title" if title)
          ]
        }
      end
    end
  end
end
