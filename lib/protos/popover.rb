# frozen_string_literal: true

module Protos
  class Popover < Component
    # DOCS: Like a dropdown, but instead of a list of menu items, its just
    # a rendered block. The popover is triggered by a button or link.
    #
    # Dropdowns, and popovers in general, use tippy.js to position content
    # rather than pure CSS for accessibility. The layout of pure CSS was too
    # tricky to get right and we felt the dependency tradeoff was worthwhile.
    #
    # Tippy.js options can be passed in via the `options` attribute or, more
    # conveniently by the typed options listed below.

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

    option :position,
      type: Positions,
      default: -> { :top },
      reader: false
    option :animation,
      type: Animations,
      default: -> { :fade },
      reader: false
    option :duration,
      type: Types::Integer | Types::Array.of(Types::Integer),
      default: -> { [300, 250] },
      reader: false
    option :hide_on_click,
      type: Types::Bool | Types.Value(:toggle),
      default: -> { true },
      reader: false
    option :z_index,
      type: Types::Integer,
      default: -> { 9999 },
      reader: false
    option :options,
      default: -> { {} },
      reader: false,
      type: Types::Hash
    option :trigger,
      default: -> { %i[mouseenter focus] },
      reader: false,
      type: Triggers | Types::Array.of(Triggers)

    def view_template(&)
      div(**attrs, &)
    end

    def content(...) = render Content.new(...)

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
