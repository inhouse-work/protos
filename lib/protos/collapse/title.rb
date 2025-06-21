# frozen_string_literal: true

module Protos
  class Collapse
    # The title of a collapse. This is the content that is always
    # visible and is used to toggle the collapse.
    class Title < Component
      # @!attribute [r] input_id
      #   @return [String, Integer, nil] The ID of the associated input element for toggling.
      option :input_id,
        type: Types::String | Types::Integer | Types::Nil,
        reader: false,
        default: -> { }

      # Renders the collapse title element.
      #
      # @yield The content block for the title content.
      # @return [nil] outputs to the @buffer
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
