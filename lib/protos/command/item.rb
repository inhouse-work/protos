# frozen_string_literal: true

module Protos
  class Command
    class Item < Component
      # DOCS: A single option within a command

      def template(&block)
        li(**attrs, &block)
      end

      private

      def default_attrs
        {
          data: { "protos--command-target": "item" }
        }
      end
    end
  end
end
