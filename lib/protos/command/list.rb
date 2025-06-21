# frozen_string_literal: true

module Protos
  class Command
    # A list of commands. This can contain either items or groups.
    class List < Component
      # Renders the command list container.
      #
      # @yield The content block to define command items and groups.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        ul(**attrs, &)
      end

      private

      def default_attrs
        {
          data: { controller: "protos--command" }
        }
      end

      def theme
        {
          container: "menu"
        }
      end
    end
  end
end
