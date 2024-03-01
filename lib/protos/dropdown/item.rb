# frozen_string_literal: true

module Protos
  class Dropdown
    class Item < Component
      def template(&block)
        li(**attrs, &block)
      end
    end
  end
end
