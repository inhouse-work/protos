# frozen_string_literal: true

module Protos
  class Drawer < Component
    # DOCS: A drawer component that can be toggled via a trigger. The content of
    # a drawer is displayed at all times and overlapped by the side when the
    # trigger is clicked.
    # https://daisyui.com/components/drawer/

    option :id, type: Types::Coercible::String

    def view_template
      div(**attrs) do
        input(id:, type: :checkbox, class: css[:toggle], autocomplete: :off)
        yield if block_given?
      end
    end

    def content(...) = render Content.new(...)

    def side(*, **, &) = render Side.new(*, id:, **, &)

    def trigger(*, **, &) = render Trigger.new(*, id:, **, &)

    private

    def theme
      {
        container: "drawer",
        toggle: %w[
          drawer-toggle
          peer
        ]
      }
    end
  end
end
