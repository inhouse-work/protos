# frozen_string_literal: true

module Protos
  class Stats < Component
    # DOCS: Stats component that contains a collection of stats
    # https://daisyui.com/components/stat/

    def template(&block)
      div(**attrs, &block)
    end

    def actions(...)
      Actions.new(...)
    end

    def description(...)
      Description.new(...)
    end

    def figure(...)
      Figure.new(...)
    end

    def stat(...)
      Stat.new(...)
    end

    def title(...)
      Title.new(...)
    end

    def value(...)
      Value.new(...)
    end

    private

    def theme
      {
        container: tokens("stats")
      }
    end
  end
end
