# frozen_string_literal: true

module Protos
  # A modal component that can be triggered by a button or a link and
  # will open a fullscreen modal, usually with a close button.
  #
  # @example Basic modal
  #   Protos::Modal.new do |modal|
  #     modal.trigger { "Open Modal" }
  #     modal.dialog do
  #       h2 { "Modal Title" }
  #       p { "Modal content goes here." }
  #       modal.close_button { "Close" }
  #     end
  #   end
  #
  # @example Modal with form
  #   Protos::Modal.new do |modal|
  #     modal.trigger { button { "Edit Profile" } }
  #     modal.dialog do
  #       form do
  #         h2 { "Edit Profile" }
  #         input(type: :text, placeholder: "Name")
  #         div(class: "modal-action") do
  #           modal.close_button { "Cancel" }
  #           button(type: :submit) { "Save" }
  #         end
  #       end
  #     end
  #   end
  class Modal < Protos::Component
    autoload :CloseButton, "protos/modal/close_button"
    autoload :Dialog, "protos/modal/dialog"
    autoload :Trigger, "protos/modal/trigger"

    # Renders the modal container element.
    #
    # @yield The content block to define trigger and dialog.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      div(**attrs, class: css[:container], &)
    end

    # Renders a close button for the modal.
    #
    # @param (see Protos::Modal::CloseButton#initialize)
    # @return [nil]
    def close_button(...) = render CloseButton.new(...)

    # Renders the modal dialog content.
    #
    # @param (see Protos::Modal::Dialog#initialize)
    # @return [nil]
    def dialog(...) = render Dialog.new(...)

    # Renders the modal trigger element.
    #
    # @param (see Protos::Modal::Trigger#initialize)
    # @return [nil]
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
