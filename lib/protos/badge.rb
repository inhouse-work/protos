# frozen_string_literal: true

module Protos
  class Badge < Component
    Badges = Types::Coercible::Symbol.enum(
      :default,
      :neutral,
      :success,
      :primary,
      :secondary,
      :info,
      :error,
      :warning,
      :ghost
    )

    Sizes = Types::Coercible::Symbol.enum(:default, :xs, :sm, :md, :lg)

    option :type, type: Badges, default: -> { :default }
    option :outline, default: -> { false }
    option :size, type: Sizes, default: -> { :default }

    def view_template(&)
      span(**attrs, &)
    end

    private

    def badge_style
      {
        neutral: "badge-neutral",
        success: "badge-success",
        primary: "badge-primary",
        secondary: "badge-secondary",
        info: "badge-info",
        error: "badge-error",
        warning: "badge-warning",
        ghost: "badge-ghost"
      }
    end

    def badge_size
      {
        xs: "badge-xs",
        sm: "badge-sm",
        md: "badge-md",
        lg: "badge-lg"
      }
    end

    def theme
      {
        container: [
          "badge",
          badge_style[type],
          badge_size[size],
          ("badge-outline" if outline)
        ].compact
      }
    end
  end
end
