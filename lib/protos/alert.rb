# frozen_string_literal: true

module Protos
  class Alert < Component
    # DOCS: A component that displays messages (usually from flashes). These can
    # be used in combination with Protos::Toast to have popup notifications.
    # https://daisyui.com/components/alert/

    AlertTypes = Types::Coercible::Symbol.enum(
      :info,
      :success,
      :warning,
      :error
    )

    COLORS = {
      info: "alert-info",
      error: "alert-error",
      warning: "alert-warning",
      success: "alert-success"
    }.freeze

    option :type, type: AlertTypes, default: -> { :info }, reader: :private

    def view_template(&)
      div(**attrs, &)
    end

    def icon(...) = render Icon.new(...)

    def actions(...) = render Actions.new(...)

    private

    def theme
      {
        container: %W[
          alert
          #{color}
        ]
      }
    end

    def color
      COLORS.fetch(type)
    end
  end
end
