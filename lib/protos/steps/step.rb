# frozen_string_literal: true

module Protos
  class Steps
    class Step < Protos::Component
      # DOCS: Step component that contains a single step in a list of steps

      Styles = Types::Coercible::Symbol.enum(
        :default,
        :primary,
        :secondary,
        :accent,
        :info,
        :success,
        :warning,
        :error
      )

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

      option :type, reader: false, type: Styles, default: -> { :default }

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
