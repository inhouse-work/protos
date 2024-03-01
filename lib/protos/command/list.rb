# frozen_string_literal: true

module Protos
  class Command
    class List < Component
      def template(&block)
        ul(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("menu")
        }
      end
    end
  end
end
