# frozen_string_literal: true

module Protos
  class Dropdown < Popover
    option :position,
           type: PositionTypes,
           default: -> { :bottom },
           reader: false

    def item(...)
      Item.new(...)
    end

    def menu(...)
      Menu.new(...)
    end

    def trigger(...)
      Trigger.new(...)
    end
  end
end
