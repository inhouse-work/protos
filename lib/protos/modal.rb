# frozen_string_literal: true

module Protos
  class Modal < Protos::Component
    # DOCS: A modal component that can be triggered by a button or a link and
    # will open a fullscreen modal, usually with a close button.

    autoload :CloseButton, "protos/modal/close_button"
    autoload :Dialog, "protos/modal/dialog"
    autoload :Trigger, "protos/modal/trigger"

    def view_template(&)
      div(**attrs, class: css[:container], &)
    end

    def close_button(...) = render CloseButton.new(...)

    def dialog(...) = render Dialog.new(...)

    def trigger(...) = render Trigger.new(...)

    private

    def default_attrs
      {
        data: {
          controller: "protos--modal",
          action: "click->protos--modal#backdropClose"
        }
      }
    end
  end
end
