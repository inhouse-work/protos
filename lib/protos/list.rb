# frozen_string_literal: true

module Protos
  class List < Component
    # DOCS: A list of items that are joined together for easier styling with
    # borders, border radius, etc.

    autoload :Item, "protos/list/item"

    option :ordered, Types::Bool, default: -> { false }, reader: false

    def view_template(&)
      send(element, **attrs, &)
    end

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
