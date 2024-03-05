module Protos
  class Swap
    class On < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("swap-on")
        }
      end
    end
  end
end
