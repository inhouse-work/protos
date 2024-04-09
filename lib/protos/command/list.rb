# frozen_string_literal: true

module Protos
  class Command
    class List < Component
      # DOCS: A list of commands. This can contain either items or groups.

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
