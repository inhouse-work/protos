# frozen_string_literal: true

module Protos
  class Collapse
    class Title < Component
      # DOCS: The title of a collapse. This is the content that is always
      # visible and is used to toggle the collapse.
      option :id,
             type: Types::Coercible::String,
             reader: false,
             default: -> { "" }

      def template(&block)
        if @id.size.positive?
          label(for: @id, **attrs, &block)
        else
          div(**attrs, &block)
        end
      end

      private

      def theme
        {
          container: tokens("collapse-title")
        }
      end
    end
  end
end
