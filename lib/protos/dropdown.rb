# frozen_string_literal: true

module Protos
  class Dropdown < Popover
    option :position,
           type: PositionTypes,
           default: -> { :bottom },
           reader: false
    option :trigger,
           default: -> { :click },
           reader: false,
           type: TriggerTypes | Types::Array.of(TriggerTypes)

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
