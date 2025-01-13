# frozen_string_literal: true

module Protos
  class Dropdown < Popover
    # DOCS: A dropdown component is basically a popover with a specific list of
    # items in a menu. It should be preferred to a popover when the content is
    # a list of actions rather than some content in its own right.
    #
    # Dropdowns, and popovers in general, use tippy.js to position content
    # rather than pure CSS for accessibility. The layout of pure CSS was too
    # tricky to get right and we felt the dependency tradeoff was worthwhile.

    autoload :Item, "protos/dropdown/item"
    autoload :Menu, "protos/dropdown/menu"
    autoload :Trigger, "protos/dropdown/trigger"

    option :position,
      type: Popover::Positions,
      default: -> { :bottom },
      reader: false
    option :trigger,
      default: -> { :click },
      reader: false,
      type: Popover::Triggers | Types::Array.of(Popover::Triggers)

    def item(...) = render Item.new(...)

    def menu(...) = render Menu.new(...)

    def trigger(...) = render Trigger.new(...)
  end
end
