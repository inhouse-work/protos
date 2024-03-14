# frozen_string_literal: true

module Protos
  class Collapse < Component
    # DOCS: A collapsible container that can be expanded or collapsed. The title
    # is visible at all times, and the content is only visible when expanded.
    # https://daisyui.com/components/collapse/

    option :checkbox, default: -> { false }, type: Types::Bool, reader: false
    option :id,
           default: -> { "collapse-#{SecureRandom.hex(4)}" },
           type: Types::String

    def template
      div(**attrs) do
        input(type: "checkbox", id:) if @checkbox
        yield if block_given?
      end
    end

    def title(*args, **kwargs, &block)
      Title.new(*args, id:, **kwargs, &block)
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
