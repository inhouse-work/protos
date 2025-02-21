# frozen_string_literal: true

module Protos
  class Menu
    class Item < Component
      option :title, type: Types::Bool, default: -> { false }

      def view_template(&)
        li(**attrs, &)
      end

      private

      def theme
        {
          container: [
            ("menu-title" if title)
          ]
        }
      end
    end
  end
end
