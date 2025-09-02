# frozen_string_literal: true

module Protos
  # @see https://daisyui.com/components/fab
  class FloatingActionButton < Component
    autoload :OpenButton, "protos/floating_action_button/open_button"
    autoload :CloseButton, "protos/floating_action_button/close_button"

    def view_template(&)
      div(**attrs, &)
    end

    # @param (see OpenButton#initialize)
    # @return [nil]
    def open_button(...) = render OpenButton.new(...)

    # @param (see CloseButton#initialize)
    def close_button(...) = render CloseButton.new(...)

    # @param (see Button#initialize)
    # @return [nil]
    def action(...) = render Button.new(...)

    # @param (see Button#initialize)
    # @return [nil]
    def main_action(*, **, &)
      render Button.new(*, theme: { container: "fab-main-action" }, **, &)
    end

    private

    def theme
      {
        container: "fab"
      }
    end
  end
end
