# frozen_string_literal: true

module Protos
  class Dropdown
    class Menu < Popover::Content
      def template(&block)
        template_tag(**template_attrs) do
          ul(**attrs, &block)
        end
      end

      private

      def theme
        {
          container: tokens(
            "menu",
            "dropdown-content",
            "z-10",
            "bg-base-100",
            "rounded-box"
          )
        }
      end
    end
  end
end
