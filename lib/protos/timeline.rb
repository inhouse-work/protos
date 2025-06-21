# frozen_string_literal: true

module Protos
  # A timeline component
  #
  # @see https://daisyui.com/components/timeline/
  #
  # @example
  #   Protos::Timeline.new(vertical: true) do |timeline|
  #     timeline.item do
  #       timeline.left { "2023" }
  #       timeline.center { "●" }
  #       timeline.right { "Event 1 happened" }
  #     end
  #     timeline.item do
  #       timeline.left { "2024" }
  #       timeline.center { "●" }
  #       timeline.right { "Event 2 happened" }
  #     end
  #   end
  class Timeline < Component

    autoload :Item, "protos/timeline/item"
    autoload :Left, "protos/timeline/left"
    autoload :Center, "protos/timeline/center"
    autoload :Right, "protos/timeline/right"

    # @!attribute [r] vertical
    #   @return [Boolean] Whether to display timeline vertically instead of horizontally.
    option :vertical, type: Types::Bool, default: -> { false }

    # Renders the full timeline element.
    #
    # @yield The content block to define timeline items.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      ul(**attrs, &)
    end

    # Renders a timeline item.
    #
    # @param (see Protos::Timeline::Item#initialize)
    # @return [nil]
    def item(...) = render Item.new(...)

    # Renders content on the left side of a timeline.
    #
    # @param (see Protos::Timeline::Left#initialize)
    # @return [nil]
    def left(...) = render Left.new(...)

    # Renders the center element of a timeline (usually an icon or marker).
    #
    # @param (see Protos::Timeline::Center#initialize)
    # @return [nil]
    def center(...) = render Center.new(...)

    # Renders content on the right side of a timeline.
    #
    # @param (see Protos::Timeline::Right#initialize)
    # @return [nil]
    def right(...) = render Right.new(...)

    private

    def theme
      {
        container: [
          "timeline",
          ("timeline-vertical" if vertical)
        ]
      }
    end
  end
end
