# frozen_string_literal: true

module Protos
  class Command < Component
    # DOCS: A command pallete component that can be used to trigger a modal with
    # filterable list of commands. Command modals are by default closable by
    # clicking the overlay rather than a specific close button.

    def view_template(&block)
      div(**attrs, &block)
    end

    def input(...)
      Input.new(...)
    end

    def list(...)
      List.new(...)
    end

    def trigger(...)
      Trigger.new(...)
    end

    def dialog(...)
      Dialog.new(...)
    end

    def title(...)
      Title.new(...)
    end

    def group(...)
      Group.new(...)
    end

    def item(...)
      Item.new
    end

    def empty(...)
      Empty.new(...)
    end

    private

    def default_attrs
      {
        data: { controller: "protos--modal" }
      }
    end
  end
end
