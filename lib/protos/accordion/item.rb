# frozen_string_literal: true

module Protos
  class Accordion
    class Item < Component
      # DOCS: An accorion is just a collapse with radio buttons.

      option :input_id, type: Types::String | Types::Integer

      def view_template(&block)
        li(**attrs) do
          render Collapse.new(
            theme: collapse_theme,
            input_id: @input_id.to_s,
            input_type: :radio,
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
