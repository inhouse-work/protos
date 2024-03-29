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

    option :type, type: AlertTypes, default: -> { :info }, reader: :private

    def template(&block)
      div(**attrs, &block)
    end

    def icon(...)
      Icon.new(...)
    end

    def actions(...)
      Actions.new(...)
    end

    private

    def theme
      {
        container: tokens(
          "alert",
          color
        )
      }
    end

    def color
      {
        info: "alert-info",
        error: "alert-error",
        warning: "alert-warning",
        success: "alert-success"
      }.fetch(type)
    end
  end
end
