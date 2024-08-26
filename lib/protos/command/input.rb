# frozen_string_literal: true

module Protos
  class Command
    class Input < Component
      # DOCS: The search input for the command palette

      option :placeholder,
             reader: :private,
             default: -> {
               "Type a command or search..."
             }

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
