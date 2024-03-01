# frozen_string_literal: true

module Protos
  class Modal < Protos::Component
    def template(&block)
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
