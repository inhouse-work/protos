# frozen_string_literal: true

module Protos
  # A component that displays messages (usually from flashes). These can
  # be used in combination with Protos::Toast to have popup notifications.
  #
  # @see https://daisyui.com/components/alert/
  class Alert < Component
    autoload :Actions, "protos/alert/actions"
    autoload :Icon, "protos/alert/icon"

    Colors = Types::Coercible::Symbol.enum(
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

    COLORS = {
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

    # @!attribute [r] type
    # @return [Symbol] One of:
    #   - `:info`
    #   - `:success`
    #   - `:warning`
    #   - `:error`
    option :color, type: Colors, default: -> { :info }

    # @!attribute [r] variant
    # @return [Symbol] One of:
    #   - `:default`
    #   - `:outline`
    #   - `:dash`
    #   - `:soft`
    option :variant, type: Variants, default: -> { :default }

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
          VARIANTS.fetch(variant)
        ]
      }
    end
  end
end
