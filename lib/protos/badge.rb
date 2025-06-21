# frozen_string_literal: true

module Protos
  # A badge component for displaying small pieces of information
  #
  # @see https://daisyui.com/components/badge/
  #
  # @example Basic badge
  #   Protos::Badge.new { "New" }
  #
  # @example Colored badge with outline
  #   Protos::Badge.new(type: :primary, outline: true) { "Featured" }
  #
  # @example Small badge with icon
  #   Protos::Badge.new(size: :sm) do
  #     icon("star")
  #     span { "Popular" }
  #   end
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

    # @!attribute [r] type
    #   @return [Symbol] One of `:default`, `:neutral`, `:success`, `:primary`, `:secondary`, `:accent`, `:info`, `:error`, `:warning`, or `:ghost` for styling.
    option :type, type: Styles, default: -> { :default }

    # @!attribute [r] outline
    #   @return [Boolean] Whether to use outline style.
    option :outline, default: -> { false }

    # @!attribute [r] dashed
    #   @return [Boolean] Whether to use dashed border style.
    option :dashed, default: -> { false }

    # @!attribute [r] soft
    #   @return [Boolean] Whether to use soft color style.
    option :soft, default: -> { false }

    # @!attribute [r] size
    #   @return [Symbol] One of `:default`, `:xs`, `:sm`, `:md`, `:lg`, or `:xl` for size.
    option :size, type: Sizes, default: -> { :default }

    # Renders the badge element.
    #
    # @yield The content block for the badge text/content.
    # @return [nil] outputs to the @buffer
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
