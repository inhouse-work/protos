# frozen_string_literal: true

module Protos
  class List < Component
    option :ordered, Types::Bool, default: -> { false }, reader: false

    def template(&block)
      send(element, **attrs, &block)
    end

    def item(...)
      Item.new(...)
    end

    private

    def theme
      {
        container: tokens(
          "join",
          "join-vertical"
        )
      }
    end

    def element
      @ordered ? :ol : :ul
    end
  end
end
