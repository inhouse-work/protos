# frozen_string_literal: true

module Protos
  class Command < Component
    # DOCS: A command pallete component that can be used to trigger a modal with
    # filterable list of commands. Command modals are by default closable by
    # clicking the overlay rather than a specific close button.

    def view_template(&)
      div(**attrs, &)
    end

    def input(...) = render Command::Input.new(...)

    def list(...) = render Command::List.new(...)

    def trigger(...) = render Command::Trigger.new(...)

    def dialog(...) = render Command::Dialog.new(...)

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
