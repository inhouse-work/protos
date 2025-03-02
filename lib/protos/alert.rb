# frozen_string_literal: true

module Protos
  class Alert < Component
    # DOCS: A component that displays messages (usually from flashes). These can
    # be used in combination with Protos::Toast to have popup notifications.
    # https://daisyui.com/components/alert/

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

    option :type, type: Styles, default: -> { :info }, reader: false

    def view_template(&)
      div(**attrs, &)
    end

    def icon(...) = render Icon.new(...)

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
