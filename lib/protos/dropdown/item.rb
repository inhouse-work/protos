# frozen_string_literal: true

module Protos
  class Dropdown
    class Item < Component
      # DOCS: A single item within a dropdown

      def view_template(&block)
        li(**attrs, &block)
      end
    end
  end
end
