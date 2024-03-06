# frozen_string_literal: true

module Protos
  class Combobox < Popover
    option :trigger,
           default: -> { :click },
           reader: false,
           type: TriggerTypes | Types::Array.of(TriggerTypes)

    def trigger(...)
      Popover::Trigger.new(...)
    end

    def content(...)
      Popover::Content.new(...)
    end

    def input(...)
      Command::Input.new(...)
    end

    def group(...)
      Command::Group.new(...)
    end

    def item(...)
      Command::Item.new(...)
    end

    def list(...)
      Command::List.new(...)
    end

    def title(...)
      Command::Title.new(...)
    end

    def empty(...)
      Command::Empty.new(...)
    end

    private

    def default_attrs
      {
        data: {
          controller: "protos--popover protos--command",
          "protos--popover-options-value": JSON.generate(options)
        }
      }
    end
  end
end
