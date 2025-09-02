# frozen_string_literal: true

module Protos
  # A status component
  #
  # @example
  #   render Protos::Status.new(type: :success, size: :lg) { "Active" }
  #
  # @example With different types
  #   render Protos::Status.new(type: :error) { "Error" }
  #   render Protos::Status.new(type: :warning) { "Warning" }
  #   render Protos::Status.new(type: :info) { "Info" }
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

    SIZES = {
      default: "status-md",
      xs: "status-xs",
      sm: "status-sm",
      md: "status-md",
      lg: "status-lg",
      xl: "status-xl"
    }.freeze

    # @!attribute [r] type
    # @return [Types::Colors]
    option :type, type: Types::Colors, default: -> { :primary }

    # @!attribute [r] size
    # @return [Sizes]
    option :size, type: Types::Sizes, default: -> { :default }

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
