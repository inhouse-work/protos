# frozen_string_literal: true

module Protos
  class Breadcrumbs
    class Crumb < Component
      def template(&block)
        li(**attrs, &block)
      end
    end
  end
end
