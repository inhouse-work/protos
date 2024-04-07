# frozen_string_literal: true

module Protos
  class Hero < Component
    # DOCS: A hero component for a page. It will center the content an
    # optionally layout an image for a responsive layout.
    # https://daisyui.com/components/hero/

    def view_template(&block)
      div(**attrs, &block)
    end

    def content(...)
      Content.new(...)
    end

    def overlay(...)
      Overlay.new(...)
    end

    private

    def theme
      {
        container: tokens("hero")
      }
    end
  end
end
