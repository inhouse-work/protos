# frozen_string_literal: true

module Protos
  class Modal < Protos::Component
    # DOCS: A modal component that can be triggered by a button or a link and
    # will open a fullscreen modal, usually with a close button.

    def view_template(&block)
      div(**attrs, class: css[:container], &block)
    end

    def close_button(...)
      CloseButton.new(...)
    end

    def dialog(...)
      Dialog.new(...)
    end

    def trigger(...)
      Trigger.new(...)
    end

    private

    def default_attrs
      {
        data: {
          controller: "protos--modal"
        }
      }
    end
  end
end
