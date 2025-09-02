# frozen_string_literal: true

module Protos
  # A component that displays messages (usually from flashes). These can
  # be used in combination with Protos::Toast to have popup notifications.
  #
  # @example
  #   render Protos::Alert.new(color: :success) do |alert|
  #     alert.icon { "✔️" }
  #     span { "Operation successful!" }
  #     alert.actions do
  #       button(class: "btn btn-sm") { "Undo" }
  #     end
  #   end
  #
  # @see https://daisyui.com/components/alert/
  class Alert < Component
    autoload :Actions, "protos/alert/actions"
    autoload :Icon, "protos/alert/icon"

    Colors = Types::Coercible::Symbol.enum(
      :default,
      :info,
      :success,
      :warning,
      :error
    )

    Variants = Types::Coercible::Symbol.enum(
      :default,
      :outline,
      :dash,
      :soft
    )

    Directions = Types::Coercible::Symbol.enum(
      :horizontal,
      :vertical
    )

    COLORS = {
      default: "",
      info: "alert-info",
      error: "alert-error",
      warning: "alert-warning",
      success: "alert-success"
    }.freeze

    VARIANTS = {
      default: "",
      outline: "alert-outline",
      dash: "alert-dash",
      soft: "alert-soft"
    }.freeze

    DIRECTIONS = {
      horizontal: "alert-horizontal",
      vertical: "alert-vertical"
    }.freeze

    # @!attribute [r] type
    # @return [Colors]
    option :color, type: Colors, default: -> { :default }

    # @!attribute [r] variant
    # @return [Variants]
    option :variant, type: Variants, default: -> { :default }

    # @!attribute [r] direction
    # @return [Directions]
    option :direction, type: Directions, default: -> { :horizontal }

    # Renders the alert container element.
    #
    # @yield The content block to define the alert contents.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      div(**attrs, &)
    end

    # Renders the alert icon.
    #
    # @param (see Protos::Alert::Icon#initialize)
    # @return [nil]
    def icon(...) = render Icon.new(...)

    # Renders the alert actions area.
    #
    # @param (see Protos::Alert::Actions#initialize)
    # @return [nil]
    def actions(...) = render Actions.new(...)

    private

    def default_attrs
      {
        role: "alert"
      }
    end

    def theme
      {
        container: [
          "alert",
          COLORS.fetch(color),
          VARIANTS.fetch(variant),
          DIRECTIONS.fetch(direction)
        ]
      }
    end
  end
end
