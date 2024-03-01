# frozen_string_literal: true

module Protos
  class Command
    class Group < Component
      def template(&block)
        li(**attrs) do
          ul(class: css[:list], &block)
        end
      end
    end
  end
end
