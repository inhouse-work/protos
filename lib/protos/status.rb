# frozen_string_literal: true

module Protos
  class Status < Component
    Styles = Types::Coercible::Symbol.enum(
      :primary,
      :secondary,
      :accent,
      :success,
      :error,
      :warning
    )

    STYLES = {
      primary: "status-primary",
      secondary: "status-secondary",
      accent: "status-accent",
      success: "status-success",
      error: "status-error",
      warning: "status-warning",
      info: "status-info"
    }.freeze

    Sizes = Types::Coercible::Symbol.enum(:xs, :sm, :md, :lg, :xl)

    SIZES = {
      xs: "status-xs",
      sm: "status-sm",
      md: "status-md",
      lg: "status-lg",
      xl: "status-xl"
    }.freeze

    option :type, type: Styles, default: -> { :primary }
    option :size, type: Sizes, default: -> { :md }

    def view_template(&)
      div(**attrs, &)
    end

    private

    def theme
      {
        container: [
          "status",
          STYLES.fetch(@type),
          SIZES.fetch(@size)
        ]
      }
    end
  end
end
