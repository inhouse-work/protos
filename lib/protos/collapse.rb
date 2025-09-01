# frozen_string_literal: true

module Protos
  # A collapsible container that can be expanded or collapsed. The title
  # is visible at all times, and the content is only visible when expanded.
  #
  # @see https://daisyui.com/components/collapse/
  #
  # @example Basic collapse with checkbox
  #   Protos::Collapse.new(icon: :plus) do |collapse|
  #     collapse.title { "Click to expand" }
  #     collapse.content do
  #       p { "This content is hidden until expanded." }
  #     end
  #   end
  #
  # @example Radio button collapse group
  #   Protos::Collapse.new(
  #     input_type: :radio,
  #     input_name: "accordion"
  #   ) do |collapse|
  #     collapse.title { "Section 1" }
  #     collapse.content { "Content for section 1" }
  #   end
  #   Protos::Collapse.new(
  #     input_type: :radio,
  #     input_name: "accordion"
  #   ) do |collapse|
  #     collapse.title { "Section 2" }
  #     collapse.content { "Content for section 2" }
  #   end
  #
  # @example Collapse with initial state
  #   Protos::Collapse.new(state: :open, icon: :arrow) do |collapse|
  #     collapse.title { "Already expanded" }
  #     collapse.content { "This starts open" }
  #   end
  class Collapse < Component
    autoload :Title, "protos/collapse/title"
    autoload :Content, "protos/collapse/content"

    Icons = Types::Coercible::Symbol.enum(:arrow, :plus)

    ICONS = {
      arrow: "collapse-arrow",
      plus: "collapse-plus"
    }.freeze

    States = Types::Coercible::Symbol.enum(:default, :open, :close)

    STATES = {
      default: "",
      open: "collapse-open",
      close: "collapse-close"
    }.freeze

    InputTypes = Types::Coercible::Symbol.enum(
      :radio,
      :checkbox
    )

    # @!attribute [r] state
    #   @return [Symbol] One of `:default`, `:open`, or `:close` for initial
    #     state.
    option :state, type: States, default: -> { :default }, reader: false

    # @!attribute [r] icon
    #   @return [Symbol] One of `:arrow` or `:plus` for the collapse icon style.
    option :icon, type: Icons, default: -> { :arrow }, reader: false

    # @!attribute [r] input_type
    #   @return [Symbol] One of `:radio` or `:checkbox` for the input mechanism.
    option :input_type,
      type: InputTypes,
      default: -> { :checkbox },
      reader: false

    # @!attribute [r] input_name
    #   @return [String, Integer] Name/ID for the input element.
    #     Auto-generated if not provided.
    option :input_name,
      reader: false,
      default: -> { "collapse-#{SecureRandom.hex(4)}" },
      type: Types::String | Types::Integer

    # Renders the collapse container element.
    #
    # @yield The content block to define title and content.
    # @return [nil] outputs to the @buffer
    def view_template
      div(**attrs) do
        if @input_type
          input(
            type: @input_type,
            id: @input_name,
            name: @input_name,
            autocomplete: :off,
            aria_label: "Toggle accordion",
            # form: "" prevents the radio button from being submitted if its
            # within a form
            form: ""
          )
        end
        yield if block_given?
      end
    end

    # Renders the collapse title (always visible, used to toggle).
    #
    # @param (see Protos::Collapse::Title#initialize)
    # @return [nil]
    def title(*, **, &) = render Title.new(*, input_id: @input_name, **, &)

    # Renders the collapse content (hidden until expanded).
    #
    # @param (see Protos::Collapse::Content#initialize)
    # @return [nil]
    def content(...) = render Content.new(...)

    private

    def theme
      {
        container: [
          "collapse",
          ICONS.fetch(@icon),
          STATES.fetch(@state)
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
