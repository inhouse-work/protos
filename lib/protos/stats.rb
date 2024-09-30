# frozen_string_literal: true

module Protos
  class Stats < Component
    # DOCS: Stats component that contains a collection of stats
    # https://daisyui.com/components/stat/

    autoload :Actions, "protos/stats/actions"
    autoload :Description, "protos/stats/description"
    autoload :Figure, "protos/stats/figure"
    autoload :Stat, "protos/stats/stat"
    autoload :Title, "protos/stats/title"
    autoload :Value, "protos/stats/value"

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
        container: "stats"
      }
    end
  end
end
