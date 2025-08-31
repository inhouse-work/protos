# frozen_string_literal: true

module Protos
  class Dropdown
    # The container for items in a dropdown. This is a restyled
    # Protos::Popover::Content component as the main functionality for
    # dropdowns comes from there.
    class Menu < Popover::Content
      option :as_template, default: -> { true }

      # Renders the dropdown menu container.
      #
      # @yield The content block to define menu items.
      # @return [nil] outputs to the @buffer
      def view_template(&block)
        element(hidden: "true", **template_attrs) do
          render ::Protos::Menu.new(**attrs, &block)
        end
      end

      private

      def element(...)
        as_template ? template(...) : div(...)
      end

      def theme
        {
          container: %w[
            dropdown-content
            z-10
          ]
        }
      end
    end
  end
end
