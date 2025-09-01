# frozen_string_literal: true

module Protos
  # A status component
  #
  # @example
  #   Protos::Status.new(type: :success, size: :lg) { "Active" }
  #
  # @example With different types
  #   Protos::Status.new(type: :error) { "Error" }
  #   Protos::Status.new(type: :warning) { "Warning" }
  #   Protos::Status.new(type: :info) { "Info" }
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

    # @!attribute [r] type
    #   @return [Symbol] One of:
    #     - `:default`
    #     - `:accent`
    #     - `:error`
    #     - `:info`
    #     - `:neutral`
    #     - `:primary`
    #     - `:secondary`
    #     - `:success`
    #     - `:warning`
    option :type, type: Types::Styles, default: -> { :primary }

    # @!attribute [r] size
    #   @return [Symbol] One of `:xs`, `:sm`, `:md`, `:lg`, or `:xl` for size.
    option :size, type: Sizes, default: -> { :md }

    # Renders the status element.
    #
    # @yield The content block for the status text.
    # @return [nil] outputs to the @buffer
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
