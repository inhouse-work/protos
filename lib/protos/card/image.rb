# frozen_string_literal: true

module Protos
  class Card
    class Image < Component
      def template(&block)
        figure(**attrs, &block)
      end
    end
  end
end
