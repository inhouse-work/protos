# frozen_string_literal: true

module Protos
  class Command
    # The search input for the command palette
    class Input < Component
      # @!attribute [r] placeholder
      # @return [String] Placeholder text for the input field.
      option :placeholder,
        default: -> {
          "Type a command or search..."
        }

      # Renders the command input element.
      #
      # @yield The content block for an optional icon.
      # @return [nil] outputs to the @buffer
      def view_template(&block)
        li(**attrs) do
          label(class: css[:label]) do
            div(class: css[:icon], &block) if block
            input(
              type: :text,
              data: {
                action: "protos--command#filter",
                "protos--command-target": "input"
              },
              class: css[:input],
              placeholder:,
              autocomplete: :off
            )
          end
        end
      end

      private

      def theme
        {
          container: "form-control",
          input: "grow bg-transparent",
          icon: "flex place-items-center",
          label: %w[
            input
            input-bordered
            flex
            items-center
            gap-2
          ]
        }
      end
    end
  end
end
