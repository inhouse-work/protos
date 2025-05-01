# frozen_string_literal: true

module Protos
  class Accordion
    class Item < Component
      # DOCS: An accorion is just a collapse with radio buttons.

      option :input_name,
        type: Types::String | Types::Integer | Types::Nil
      option :input_type,
        type: Collapse::InputTypes,
        default: -> { :radio }

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
