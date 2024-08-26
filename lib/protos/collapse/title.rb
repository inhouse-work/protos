# frozen_string_literal: true

module Protos
  class Collapse
    class Title < Component
      # DOCS: The title of a collapse. This is the content that is always
      # visible and is used to toggle the collapse.

      option :input_id,
             type: Types::String | Types::Integer | Types::Nil,
             reader: false,
             default: -> { }

      def view_template(&)
        if @input_id
          label(for: @input_id.to_s, **attrs, &)
        else
          div(**attrs, &)
        end
      end

      private

      def theme
        {
          container: "collapse-title"
        }
      end
    end
  end
end
