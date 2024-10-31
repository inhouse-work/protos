# frozen_string_literal: true

module Protos
  class Command < Component
    # DOCS: A command pallete component that can be used to trigger a modal with
    # filterable list of commands. Command modals are by default closable by
    # clicking the overlay rather than a specific close button.

    autoload :Input, "protos/command/input"
    autoload :Dialog, "protos/command/dialog"
    autoload :Group, "protos/command/group"
    autoload :List, "protos/command/list"
    autoload :Trigger, "protos/command/trigger"
    autoload :Title, "protos/command/title"
    autoload :Item, "protos/command/item"
    autoload :Empty, "protos/command/empty"

    def view_template(&)
      div(**attrs, &)
    end

    def input(...) = render Command::Input.new(...)

    def list(...) = render Command::List.new(...)

    def trigger(...) = render Command::Trigger.new(...)

    def dialog(...) = render Modal::Dialog.new(...)

    def close_button(...) = render Modal::CloseButton.new(...)

    def title(...) = render Command::Title.new(...)

    def group(...) = render Command::Group.new(...)

    def item(...) = render Command::Item.new(...)

    def empty(...) = render Command::Empty.new(...)

    private

    def default_attrs
      {
        data: { controller: "protos--modal" }
      }
    end
  end
end
