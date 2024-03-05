# frozen_string_literal: true

module Protos
  class Carousel < Component
    def template(&block)
      div(**attrs, &block)
    end

    def item(...)
      Item.new(...)
    end

    private

    def theme
      {
        container: tokens("carousel")
      }
    end
  end
end
