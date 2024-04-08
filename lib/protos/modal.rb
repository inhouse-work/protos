# frozen_string_literal: true

module Protos
  class Modal < Protos::Component
    # DOCS: A modal component that can be triggered by a button or a link and
    # will open a fullscreen modal, usually with a close button.

    def view_template(&block)
      div(**attrs, class: css[:container], &block)
    end

    def close_button(...) = render CloseButton.new(...)

    def dialog(...) = render Dialog.new(...)

    def trigger(...) = render Trigger.new(...)

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
