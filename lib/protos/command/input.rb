# frozen_string_literal: true

module Protos
  class Command
    class Input < Component
      option :placeholder,
             default: -> {
               "Type a command or search..."
             },
             reader: :private

      def template(&block)
        div(**attrs) do
          label(class: css[:label]) do
            div(class: css[:icon], &block) if block
            input(
              type: :text,
              data: { action: "protos--command#filter" },
              class: css[:input],
              placeholder:
            )
          end
        end
      end

      private

      def style
        {
          container: tokens("form-control"),
          label: tokens(
            "input",
            "input-bordered",
            "flex",
            "items-center",
            "gap-2"
          ),
          input: tokens("grow", "bg-transparent"),
          icon: tokens("flex", "place-items-center")
        }
      end
    end
  end
end
