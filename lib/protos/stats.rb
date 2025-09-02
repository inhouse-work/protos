# frozen_string_literal: true

module Protos
  # A stats component that contains a collection of stats
  #
  # @see https://daisyui.com/components/stat/
  #
  # @example
  #   render Protos::Stats.new do |stats|
  #     stats.stat do
  #       stats.title { "Total Page Views" }
  #       stats.value { "89,400" }
  #       stats.description { "21% more than last month" }
  #     end
  #     stats.stat do
  #       stats.figure { icon("chart") }
  #       stats.title { "Downloads" }
  #       stats.value { "31K" }
  #       stats.description { "Jan 1st - Feb 1st" }
  #       stats.actions do
  #         button { "View report" }
  #       end
  #     end
  #   end
  class Stats < Component
    autoload :Actions, "protos/stats/actions"
    autoload :Description, "protos/stats/description"
    autoload :Figure, "protos/stats/figure"
    autoload :Stat, "protos/stats/stat"
    autoload :Title, "protos/stats/title"
    autoload :Value, "protos/stats/value"

    # Renders the full stats element.
    #
    # @yield The content block to define individual stats.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      div(**attrs, &)
    end

    # Renders actions for a stat (e.g. buttons).
    #
    # @param (see Protos::Stats::Actions#initialize)
    # @return [nil]
    def actions(...) = render Actions.new(...)

    # Renders a description for a stat.
    #
    # @param (see Protos::Stats::Description#initialize)
    # @return [nil]
    def description(...) = render Description.new(...)

    # Renders a figure for a stat (usually an icon or image).
    #
    # @param (see Protos::Stats::Figure#initialize)
    # @return [nil]
    def figure(...) = render Figure.new(...)

    # Renders a single stat container.
    #
    # @param (see Protos::Stats::Stat#initialize)
    # @return [nil]
    def stat(...) = render Stat.new(...)

    # Renders a title for a stat.
    #
    # @param (see Protos::Stats::Title#initialize)
    # @return [nil]
    def title(...) = render Title.new(...)

    # Renders a value for a stat.
    #
    # @param (see Protos::Stats::Value#initialize)
    # @return [nil]
    def value(...) = render Value.new(...)

    private

    def theme
      {
        container: "stats"
      }
    end
  end
end
