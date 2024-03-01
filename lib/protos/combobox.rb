# frozen_string_literal: true

module Protos
  class Combobox < Component
    def template
      div(**attrs) do
        render Popover.new do
          yield if block_given?
        end
      end
    end

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

    def attrs
      @attrs ||= build_attrs(
        data: { controller: "protos--command" }
      )
    end
  end
end
