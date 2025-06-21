# frozen_string_literal: true

module Protos
  class Command
    # An optional group for holding a heading and a list of options.
    # Items in the group will have a divider line on the left side and can
    # optionally have a title.
    class Group < Component

      # Renders the command group container.
      #
      # @yield The content block to define group items and title.
      # @return [nil] outputs to the @buffer
      def view_template(&block)
        li(**attrs) do
          ul(class: css[:list], &block)
        end
      end

      private

      def default_attrs
        {
          data: { "protos--command-target": "group" }
        }
      end
    end
  end
end
