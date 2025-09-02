# frozen_string_literal: true

module Protos
  class Accordion
    # An accordion item containing a title and collapsible content
    class Item < Component
      # @!attribute [r] input_name
      #   @return [String, Integer, nil] Name/ID for the radio input.
      option :input_name,
        type: Types::String | Types::Integer | Types::Nil

      # @!attribute [r] input_type
      #   @return [Collapse::InputTypes]
      option :input_type,
        type: Collapse::InputTypes,
        default: -> { :radio }

      # Renders the accordion item container.
      #
      # @yield The content block for title and content.
      # @return [nil] outputs to the @buffer
      def view_template(&block)
        li(**attrs) do
          render Collapse.new(
            theme: collapse_theme,
            input_name:,
            input_type:,
            &block
          )
        end
      end

      private

      def collapse_theme
        { "!container": "bg-base-100" }.tap do |theme|
          theme[:container!] = css[:collapse] if css[:collapse]
        end
      end

      def theme
        {
          container: "join-item"
        }
      end
    end
  end
end
