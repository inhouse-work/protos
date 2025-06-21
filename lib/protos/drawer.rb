# frozen_string_literal: true

module Protos
  # A drawer component that can be toggled via a trigger. The content of
  # a drawer is displayed at all times and overlapped by the side when the
  # trigger is clicked.
  #
  # @see https://daisyui.com/components/drawer/
  #
  # @example Basic drawer
  #   Protos::Drawer.new do |drawer|
  #     drawer.content do
  #       div(class: "p-4") do
  #         h1 { "Main Content" }
  #         drawer.trigger { "Open Drawer" }
  #       end
  #     end
  #     drawer.side do
  #       div(class: "p-4 w-80 bg-base-200") do
  #         h2 { "Drawer Content" }
  #         ul do
  #           li { a(href: "/") { "Home" } }
  #           li { a(href: "/about") { "About" } }
  #         end
  #       end
  #     end
  #   end
  #
  # @example Drawer with custom ID
  #   Protos::Drawer.new(id: "my-drawer") do |drawer|
  #     drawer.content { "Main content here" }
  #     drawer.side { "Side content here" }
  #   end
  class Drawer < Component

    autoload :Side, "protos/drawer/side"
    autoload :Trigger, "protos/drawer/trigger"
    autoload :Content, "protos/drawer/content"

    # @!attribute [r] id
    #   @return [String] Unique identifier for the drawer. Auto-generated if not provided.
    option :id,
      reader: false,
      type: Types::Coercible::String,
      default: -> { "drawer-#{SecureRandom.hex(4)}" }

    # Renders the drawer container element.
    #
    # @yield The content block to define drawer content and side.
    # @return [nil] outputs to the @buffer
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

    # Renders the drawer content area (main content).
    #
    # @param (see Protos::Drawer::Content#initialize)
    # @return [nil]
    def content(...) = render Content.new(...)

    # Renders the drawer side panel.
    #
    # @param (see Protos::Drawer::Side#initialize)
    # @return [nil]
    def side(*, **, &) = render Side.new(*, input_id: @id, **, &)

    # Renders the drawer trigger element.
    #
    # @param (see Protos::Drawer::Trigger#initialize)
    # @return [nil]
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
