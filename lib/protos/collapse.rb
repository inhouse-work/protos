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

    def view_template
      div(**attrs) do
        input(type: "checkbox", id:, autocomplete: :off) if @checkbox
        yield if block_given?
      end
    end

    def title(*, **, &) = render Title.new(*, id:, **, &)

    def content(...) = render Content.new(...)

    private

    def theme
      {
        container: %w[
          collapse
          collapse-arrow
          bg-base-100
        ]
      }
    end

    def default_attrs
      {
        tabindex: 0
      }
    end
  end
end
