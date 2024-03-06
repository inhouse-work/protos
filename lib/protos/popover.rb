# frozen_string_literal: true

module Protos
  class Popover < Component
    # DOCS: Like a dropdown, but instead of a list of menu items, its just
    # a rendered block

    PositionTypes = Types::Coercible::Symbol.enum(
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

    AnimationTypes = Types::Coercible::Symbol.enum(
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

    TriggerTypes = Types::Coercible::Symbol.enum(
      :focus,
      :mouseenter,
      :click,
      :focusin,
      :manual
    )

    option :position,
           type: PositionTypes,
           default: -> { :top },
           reader: false
    option :animation,
           type: AnimationTypes,
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
           type: TriggerTypes | Types::Array.of(TriggerTypes)

    def template(&block)
      div(**attrs, &block)
    end

    def content(...)
      Content.new(...)
    end

    def trigger(...)
      Trigger.new(...)
    end

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
