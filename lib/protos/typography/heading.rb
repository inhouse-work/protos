# frozen_string_literal: true

module Protos
  module Typography
    class Heading < Protos::Component
      # DOCS: A heading component that encapsulates all heading levels by their
      # size and level.

      Sizes = Types::Coercible::Symbol.enum(:xs, :sm, :md, :lg, :xl)
      Levels = Types::Integer.enum(1, 2, 3, 4, 5, 6)

      SIZES = {
        xs: "text-lg font-medium",
        sm: "text-xl font-medium",
        md: "text-2xl font-semibold",
        lg: "text-3xl font-semibold md:text-4xl",
        xl: "text-4xl font-bold md:text-5xl"
      }.freeze

      option :size, type: Sizes, default: -> { "md" }, reader: false
      option :level, type: Levels, default: -> { 1 }, reader: false

      def view_template(&)
        send(element, **attrs, &)
      end

      private

      def theme
        {
          container: [
            size,
            "scroll-m-20",
            "tracking-tight",
            "transition-colors"
          ]
        }
      end

      def size
        SIZES.fetch(@size.to_sym)
      end

      def element
        %i[h1 h2 h3 h4 h5 h6][@level - 1]
      end
    end
  end
end
