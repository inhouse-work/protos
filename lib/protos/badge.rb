# frozen_string_literal: true

module Protos
  class Badge < Component
    Styles = Types::Coercible::Symbol.enum(
      *Types::Styles.values,
      :ghost
    )

    Sizes = Types::Coercible::Symbol.enum(:default, :xs, :sm, :md, :lg, :xl)

    STYLES = {
      default: "",
      neutral: "badge-neutral",
      success: "badge-success",
      primary: "badge-primary",
      secondary: "badge-secondary",
      accent: "badge-accent",
      info: "badge-info",
      error: "badge-error",
      warning: "badge-warning",
      ghost: "badge-ghost"
    }.freeze

    SIZES = {
      default: "badge-md",
      xs: "badge-xs",
      sm: "badge-sm",
      md: "badge-md",
      lg: "badge-lg",
      xl: "badge-xl"
    }.freeze

    option :type, type: Styles, default: -> { :default }
    option :outline, default: -> { false }
    option :dashed, default: -> { false }
    option :soft, default: -> { false }
    option :size, type: Sizes, default: -> { :default }

    def view_template(&)
      span(**attrs, &)
    end

    private

    def theme
      {
        container: [
          "badge",
          STYLES.fetch(type),
          SIZES.fetch(size),
          ("badge-outline" if outline),
          ("badge-dashed" if dashed),
          ("badge-soft" if soft)
        ].compact
      }
    end
  end
end
