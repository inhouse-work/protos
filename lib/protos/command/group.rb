# frozen_string_literal: true

module Protos
  class Command
    class Group < Component
      # DOCS: An optional group for holding a heading and a list of options.
      # Items in the group will have a divider line on the left side and can
      # optionally have a title.

      def view_template(&block)
        li(**attrs) do
          ul(class: css[:list], &block)
        end
      end
    end
  end
end
