# frozen_string_literal: true

module Protos
  class Collapse < Component
    def template(&block)
      div(**attrs, &block)
    end

    def title(...)
      Title.new(...)
    end

    def content(...)
      Content.new(...)
    end

    private

    def theme
      {
        container: tokens("collapse", "collapse-arrow", "bg-base-100")
      }
    end

    def default_attrs
      {
        tabindex: 0
      }
    end
  end
end
