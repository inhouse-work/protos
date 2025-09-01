# frozen_string_literal: true

module Protos
  # A component that displays messages (usually from flashes). These can
  # be used in combination with Protos::Toast to have popup notifications.
  #
  # @see https://daisyui.com/components/alert/
  class Alert < Component
    autoload :Actions, "protos/alert/actions"
    autoload :Icon, "protos/alert/icon"

    Styles = Types::Coercible::Symbol.enum(
      :info,
      :success,
      :warning,
      :error
    )

    STYLES = {
      info: "alert-info",
      error: "alert-error",
      warning: "alert-warning",
      success: "alert-success"
    }.freeze

    # @!attribute [r] type
    #  @return [Symbol] One of:
    #    - `:info`
    #    - `:success`
    #    - `:warning`
    #    - `:error`
    option :type, type: Styles, default: -> { :info }, reader: false

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

    def theme
      {
        container: ["alert", style]
      }
    end

    def style
      STYLES.fetch(@type)
    end
  end
end
