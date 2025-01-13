# frozen_string_literal: true

module Protos
  class Combobox < Popover
    # DOCS: A combobox is a combination of a text input and a list of options.
    # It makes selecting values from a large list easier by filtering the list.
    # Comboboxes use popovers and command to create the list of options.

    option :trigger,
      default: -> { :click },
      reader: false,
      type: Popover::Triggers | Types::Array.of(Popover::Triggers)

    def trigger(...) = render Popover::Trigger.new(...)

    def content(...) = render Popover::Content.new(...)

    def input(...) = render Command::Input.new(...)

    def group(...) = render Command::Group.new(...)

    def item(...) = render Command::Item.new(...)

    def list(...) = render Command::List.new(...)

    def title(...) = render Command::Title.new(...)

    def empty(...) = render Command::Empty.new(...)

    private

    def default_attrs
      {
        data: {
          controller: "protos--popover",
          "protos--popover-options-value": JSON.generate(options)
        }
      }
    end
  end
end
