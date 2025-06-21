# frozen_string_literal: true

module Protos
  class Command
    # The title for a group of commands. This is expected to be used
    # inside a Protos::Command::Group component.
    class Title < Component

      # Renders the command group title.
      #
      # @yield The content block for the title text.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        li { h2(**attrs, &) }
      end

      private

      def theme
        {
          container: "menu-title"
        }
      end
    end
  end
end
