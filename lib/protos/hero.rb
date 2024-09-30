# frozen_string_literal: true

module Protos
  class Hero < Component
    # DOCS: A hero component for a page. It will center the content an
    # optionally layout an image for a responsive layout.
    # https://daisyui.com/components/hero/

    autoload :Content, "protos/hero/content"
    autoload :Overlay, "protos/hero/overlay"

    def view_template(&)
      div(**attrs, &)
    end

    def content(...) = render Content.new(...)

    def overlay(...) = render Overlay.new(...)

    private

    def theme
      {
        container: "hero"
      }
    end
  end
end
