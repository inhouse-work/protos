# frozen_string_literal: true

module Protos
  class Dropdown
    class Item < Component
      # DOCS: A single item within a dropdown

      def view_template(&)
        li(**attrs, &)
      end
    end
  end
end
