# frozen_string_literal: true

module Protos
  # A list of items that are joined together for easier styling with
  # borders, border radius, etc.
  #
  # @example Basic unordered list
  #   Protos::List.new do |list|
  #     list.item { "First item" }
  #     list.item { "Second item" }
  #     list.item { "Third item" }
  #   end
  #
  # @example Ordered list
  #   Protos::List.new(ordered: true) do |list|
  #     list.item { "Step 1: Do this" }
  #     list.item { "Step 2: Then this" }
  #     list.item { "Step 3: Finally this" }
  #   end
  class List < Component

    autoload :Item, "protos/list/item"

    # @!attribute [r] ordered
    #   @return [Boolean] Whether to render as an ordered list (ol) instead of unordered (ul).
    option :ordered, Types::Bool, default: -> { false }, reader: false

    # Renders the full list element.
    #
    # @yield The content block to define list items.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      send(element, **attrs, &)
    end

    # Renders a list item.
    #
    # @param (see Protos::List::Item#initialize)
    # @return [nil]
    def item(...) = render Item.new(...)

    private

    def theme
      {
        container: "list"
      }
    end

    def element
      @ordered ? :ol : :ul
    end
  end
end
