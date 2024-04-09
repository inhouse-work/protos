# frozen_string_literal: true

module Protos
  class Command < Component
    # DOCS: A command pallete component that can be used to trigger a modal with
    # filterable list of commands. Command modals are by default closable by
    # clicking the overlay rather than a specific close button.

    def view_template(&)
      div(**attrs, &)
    end

    def input(...) = render Input.new(...)

    def list(...) = render List.new(...)

    def trigger(...) = render Trigger.new(...)

    def dialog(...) = render Dialog.new(...)

    def title(...) = render Title.new(...)

    def group(...) = render Group.new(...)

    def item(...) = render Item.new(...)

    def empty(...) = render Empty.new(...)

    private

    def default_attrs
      {
        data: { controller: "protos--modal" }
      }
    end
  end
end
