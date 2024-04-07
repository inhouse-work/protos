# frozen_string_literal: true

module Protos
  module Typography
    class Heading < Protos::Component
      # DOCS: A heading component that encapsulates all heading levels by their
      # size and level.

      SizeTypes = Types::Coercible::Symbol.enum(:xs, :sm, :md, :lg, :xl)
      LevelTypes = Types::Integer.enum(1, 2, 3, 4, 5, 6)

      option :size, type: SizeTypes, default: -> { "md" }, reader: false
      option :level, type: LevelTypes, default: -> { 1 }, reader: false

      def view_template(&block)
        send(element, **attrs, &block)
      end

      private

      def theme
        {
          container: tokens(
            size,
            "scroll-m-20",
            "tracking-tight",
            "transition-colors"
          )
        }
      end

      def size
        {
          xs: "text-lg font-medium",
          sm: "text-xl font-medium",
          md: "text-2xl font-semibold",
          lg: "text-3xl font-semibold md:text-4xl",
          xl: "text-4xl font-bold md:text-5xl"
        }.fetch(@size.to_sym)
      end

      def element
        %i[h1 h2 h3 h4 h5 h6][@level - 1]
      end
    end
  end
end
