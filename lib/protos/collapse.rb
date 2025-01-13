# frozen_string_literal: true

module Protos
  class Collapse < Component
    # DOCS: A collapsible container that can be expanded or collapsed. The title
    # is visible at all times, and the content is only visible when expanded.
    # https://daisyui.com/components/collapse/

    autoload :Title, "protos/collapse/title"
    autoload :Content, "protos/collapse/content"

    option :input_type, default: -> { :checkbox }, reader: false
    option :input_name,
      reader: false,
      default: -> { "collapse-#{SecureRandom.hex(4)}" },
      type: Types::String | Types::Integer

    def view_template
      div(**attrs) do
        if @input_type
          input(
            type: @input_type,
            id: @input_name,
            name: @input_name,
            autocomplete: :off,
            # form: "" prevents the radio button from being submitted if its
            # within a form
            form: ""
          )
        end
        yield if block_given?
      end
    end

    def title(*, **, &) = render Title.new(*, input_id: @input_name, **, &)

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
