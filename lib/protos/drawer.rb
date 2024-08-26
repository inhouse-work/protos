# frozen_string_literal: true

module Protos
  class Drawer < Component
    # DOCS: A drawer component that can be toggled via a trigger. The content of
    # a drawer is displayed at all times and overlapped by the side when the
    # trigger is clicked.
    # https://daisyui.com/components/drawer/

    option :id,
           reader: false,
           type: Types::Coercible::String,
           default: -> { "drawer-#{SecureRandom.hex(4)}" }

    def view_template
      div(**attrs) do
        input(
          id: @id,
          type: :checkbox,
          class: css[:toggle],
          autocomplete: :off,
          form: ""
        )
        yield if block_given?
      end
    end

    def content(...) = render Content.new(...)

    def side(*, **, &) = render Side.new(*, input_id: @id, **, &)

    def trigger(*, **, &) = render Trigger.new(*, input_id: @id, **, &)

    private

    def theme
      {
        container: "drawer",
        toggle: "drawer-toggle peer"
      }
    end
  end
end
