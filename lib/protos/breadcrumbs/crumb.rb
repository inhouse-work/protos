# frozen_string_literal: true

module Protos
  class Breadcrumbs
    # A single breadcrumb item
    class Crumb < Component
      # Renders the breadcrumb item element.
      #
      # @yield The content block for the crumb content (usually a link).
      # @return [nil] outputs to the @buffer
      def view_template(&)
        li(**attrs, &)
      end
    end
  end
end
