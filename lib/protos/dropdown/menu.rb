# frozen_string_literal: true

module Protos
  class Dropdown
    class Menu < Popover::Content
      # DOCS: The container for items in a dropdown. This is a restyled
      # Protos::Popover::Content component as the main functionality for
      # dropdowns comes from there.

      def view_template(&block)
        template(**template_attrs) do
          render ::Protos::Menu.new(**attrs, &block)
        end
      end

      private

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
