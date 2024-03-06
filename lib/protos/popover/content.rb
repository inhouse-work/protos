# frozen_string_literal: true

module Protos
  class Popover
    class Content < Component
      def template(&block)
        template_tag(data: { "protos--popover-target": "template" }) do
          div(**attrs, &block)
        end
      end
    end
  end
end
