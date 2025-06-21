# frozen_string_literal: true

module Protos
  class Steps
    class Step < Protos::Component
      # A single step in a steps component.
      #
      # @example Basic step
      #   steps.step { "Step 1" }
      #
      # @example Colored step
      #   steps.step(type: :primary) { "Completed Step" }
      #
      # @example With custom content
      #   steps.step do
      #     div(class: "flex items-center gap-2") do
      #       icon(:check)
      #       span { "Verified" }
      #     end
      #   end
      #
      # @!attribute [r] type
      #   @return [Symbol] The color/style of the step - :default, :primary, :secondary,
      #     :accent, :info, :success, :warning, or :error
      #
      # @note This component:
      #   - Should be used within a Steps container
      #   - Can contain any content (text, icons, etc)
      #   - Inherits vertical/horizontal orientation from parent Steps
      #
      # @see Protos::Steps The parent steps component

      STYLES = {
        default: "",
        primary: "step-primary",
        secondary: "step-secondary",
        accent: "step-accent",
        info: "step-info",
        success: "step-success",
        warning: "step-warning",
        error: "step-error"
      }.freeze

      option :type, reader: false, type: Types::Styles, default: -> { :default }

      def view_template(&)
        li(**attrs, &)
      end

      private

      def type
        STYLES.fetch(@type)
      end

      def theme
        {
          container: "step #{type}"
        }
      end
    end
  end
end
