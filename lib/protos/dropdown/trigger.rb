# frozen_string_literal: true

module Protos
  class Dropdown
    class Trigger < Component
      def template(&block)
        summary(**attrs, &block)
      end
    end
  end
end
