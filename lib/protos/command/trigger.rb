# frozen_string_literal: true

module Protos
  class Command
    class Trigger < Component
      def template(&block)
        button(**attrs, &block)
      end

      private

      def attrs
        @attrs ||= build_attrs(
          {
            data: { action: "protos--modal#open" }
          }
        )
      end
    end
  end
end
