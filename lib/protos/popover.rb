# frozen_string_literal: true

module Protos
  # A popover component that displays content in a floating container
  #
  # Like a dropdown, but instead of a list of menu items, it's just
  # a rendered block. The popover is triggered by a button or link.
  #
  # Dropdowns, and popovers in general, use tippy.js to position content
  # rather than pure CSS for accessibility. The layout of pure CSS was too
  # tricky to get right and we felt the dependency tradeoff was worthwhile.
  #
  # Tippy.js options can be passed in via the `options` attribute or, more
  # conveniently by the typed options listed below.
  #
  # @example Basic popover
  #   Protos::Popover.new(position: :bottom) do |popover|
  #     popover.trigger { "Click me" }
  #     popover.content { "This is the popover content!" }
  #   end
  #
  # @example With custom animation and trigger
  #   Protos::Popover.new(
  #     position: :right,
  #     animation: :scale,
  #     trigger: :click,
  #     duration: 500
  #   ) do |popover|
  #     popover.trigger { button { "Show popover" } }
  #     popover.content do
  #       div(class: "p-4") do
  #         h3 { "Popover Title" }
  #         p { "Some detailed content here." }
  #       end
  #     end
  #   end
  class Popover < Component
    autoload :Trigger, "protos/popover/trigger"
    autoload :Content, "protos/popover/content"

    Positions = Types::Coercible::Symbol.enum(
      :top,
      :top_start,
      :top_end,
      :right,
      :right_start,
      :right_end,
      :bottom,
      :bottom_start,
      :bottom_end,
      :left,
      :left_start,
      :left_end
    )

    Animations = Types::Coercible::Symbol.enum(
      :fade,
      :shift_away,
      :shift_away_subtle,
      :shift_away_extreme,
      :shift_towards,
      :shift_towards_subtle,
      :shift_towards_extreme,
      :scale,
      :scale_subtle,
      :scale_extreme,
      :perspective,
      :perspective_subtle,
      :perspective_extreme
    )

    Triggers = Types::Coercible::Symbol.enum(
      :focus,
      :mouseenter,
      :click,
      :focusin,
      :manual
    )

    # @!attribute [r] position
    #   @return [Symbol] One of:
    #     - `:top`
    #     - `:top_start`
    #     - `:top_end`
    #     - `:right`
    #     - `:right_start`
    #     - `:right_end`
    #     - `:bottom`
    #     - `:bottom_start`
    #     - `:bottom_end`
    #     - `:left`
    #     - `:left_start`
    #     - `:left_end`
    option :position,
      type: Positions,
      default: -> { :top },
      reader: false

    # @!attribute [r] animation
    #   @return [Symbol] One of:
    #     - `:fade`
    #     - `:shift_away`
    #     - `:shift_away_subtle`
    #     - `:shift_away_extreme`
    #     - `:shift_towards`
    #     - `:shift_towards_subtle`
    #     - `:shift_towards_extreme`
    #     - `:scale`
    #     - `:scale_subtle`
    #     - `:scale_extreme`
    #     - `:perspective`
    #     - `:perspective_subtle`
    #     - `:perspective_extreme`
    option :animation,
      type: Animations,
      default: -> { :fade },
      reader: false

    # @!attribute [r] duration
    #   @return [Integer, Array<Integer>] Duration in milliseconds for
    #     show/hide animation. Can be a single value or array of
    #     [show, hide] durations.
    option :duration,
      type: Types::Integer | Types::Array.of(Types::Integer),
      default: -> { [300, 250] },
      reader: false

    # @!attribute [r] hide_on_click
    #   @return [Boolean, Symbol] Whether to hide popover on click.
    #     Can be `true`, `false`, or `:toggle`.
    option :hide_on_click,
      type: Types::Bool | Types.Value(:toggle),
      default: -> { true },
      reader: false

    # @!attribute [r] z_index
    #   @return [Integer] Z-index value for the popover.
    option :z_index,
      type: Types::Integer,
      default: -> { 9999 },
      reader: false

    # @!attribute [r] options
    #   @return [Hash] Additional tippy.js options to pass through.
    option :options,
      default: -> { {} },
      reader: false,
      type: Types::Hash

    # @!attribute [r] trigger
    #   @return [Symbol, Array<Symbol>] One or more of:
    #     - `:focus`
    #     - `:mouseenter`
    #     - `:click`
    #     - `:focusin`
    #     - `:manual`
    option :trigger,
      default: -> { %i[mouseenter focus] },
      reader: false,
      type: Triggers | Types::Array.of(Triggers)

    # Renders the popover container element.
    #
    # @yield The content block to define trigger and content.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      div(**attrs, &)
    end

    # Renders the popover content.
    #
    # @param (see Protos::Popover::Content#initialize)
    # @return [nil]
    def content(...) = render Content.new(...)

    # Renders the popover trigger element.
    #
    # @param (see Protos::Popover::Trigger#initialize)
    # @return [nil]
    def trigger(...) = render Trigger.new(...)

    private

    def dasherize(string)
      string.to_s.tr("_", "-")
    end

    def options
      opts = {}
      opts[:animation] = dasherize(@animation)
      opts[:placement] = dasherize(@position)
      opts[:duration] = @duration
      opts[:hideOnClick] = @hide_on_click
      opts[:zIndex] = @z_index
      opts[:trigger] = Array(@trigger).flatten.map(&:to_s).join(" ")
      opts.merge(@options)
    end

    def default_attrs
      {
        data: {
          controller: "protos--popover",
          "protos--popover-options-value": JSON.generate(options)
        }
      }
    end
  end
end
