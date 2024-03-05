module Protos
  class Swap
    class Off < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("swap-off")
        }
      end
    end
  end
end
