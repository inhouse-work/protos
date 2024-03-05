# frozen_string_literal: true

module Protos
  class Stats < Component
    def template(&block)
      div(**attrs, &block)
    end

    private

    def theme
      {
        container: tokens("stats")
      }
    end
  end
end
