# frozen_string_literal: true

module Protos
  class Command
    class Title < Component
      # DOCS: The title for a group of commands. This is expected to be used
      # inside a Protos::Command::Group component.

      def template(&block)
        h2(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("menu-title")
        }
      end
    end
  end
end
