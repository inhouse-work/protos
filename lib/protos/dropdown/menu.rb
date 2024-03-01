# frozen_string_literal: true

module Protos
  class Dropdown
    class Menu < Component
      def template(&block)
        ul(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens(
            "menu",
            "dropdown-content",
            "z-[1]",
            "bg-base-100",
            "rounded-box"
          )
        }
      end
    end
  end
end
