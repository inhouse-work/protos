# frozen_string_literal: true

module Protos
  class Stats < Component
    # DOCS: Stats component that contains a collection of stats
    # https://daisyui.com/components/stat/

    def view_template(&)
      div(**attrs, &)
    end

    def actions(...) = render Actions.new(...)

    def description(...) = render Description.new(...)

    def figure(...) = render Figure.new(...)

    def stat(...) = render Stat.new(...)

    def title(...) = render Title.new(...)

    def value(...) = render Value.new(...)

    private

    def theme
      {
        container: tokens("stats")
      }
    end
  end
end
