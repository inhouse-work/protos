# frozen_string_literal: true

module Protos
  class Breadcrumbs
    class Crumb < Component
      # DOCS: A crumb is a single item within a breadcrumb

      def view_template(&)
        li(**attrs, &)
      end
    end
  end
end
