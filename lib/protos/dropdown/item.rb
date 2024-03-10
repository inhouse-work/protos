# frozen_string_literal: true

module Protos
  class Dropdown
    class Item < Component
      # DOCS: A single item within a dropdown

      def template(&block)
        li(**attrs, &block)
      end
    end
  end
end
