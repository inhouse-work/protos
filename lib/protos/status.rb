# frozen_string_literal: true

module Protos
  class Status < Component
    STYLES = {
      default: "",
      accent: "status-accent",
      error: "status-error",
      info: "status-info",
      neutral: "status-neutral",
      primary: "status-primary",
      secondary: "status-secondary",
      success: "status-success",
      warning: "status-warning"
    }.freeze

    Sizes = Types::Coercible::Symbol.enum(:xs, :sm, :md, :lg, :xl)

    SIZES = {
      xs: "status-xs",
      sm: "status-sm",
      md: "status-md",
      lg: "status-lg",
      xl: "status-xl"
    }.freeze

    option :type, type: Types::Styles, default: -> { :primary }
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
