# frozen_string_literal: true

module Protos
  # An accordion component that shows collapsible content sections
  #
  # @see https://daisyui.com/components/accordion/
  #
  # @example Basic accordion
  #   Protos::Accordion.new do |accordion|
  #     accordion.item do
  #       accordion.title { "Section 1" }
  #       accordion.content { "Content for section 1" }
  #     end
  #     accordion.item do
  #       accordion.title { "Section 2" }
  #       accordion.content { "Content for section 2" }
  #     end
  #   end
  #
  # @example Accordion with custom name
  #   Protos::Accordion.new(input_name: "custom-accordion") do |accordion|
  #     accordion.item do
  #       accordion.title { "Custom Section" }
  #       accordion.content { "Custom content" }
  #     end
  #   end
  class Accordion < Component
    autoload :Item, "protos/accordion/item"

    # @!attribute [r] input_name
    #   @return [String] Name/ID for the accordion radio group. Auto-generated
    #     if not provided.
    option :input_name,
      default: -> { "accordion-#{SecureRandom.hex(4)}" },
      type: Types::String

    # @!attribute [r] input_type
    # @return [Symbol] One of `:radio` or `:checkbox` for accordion behavior.
    #   Use `:radio` for traditional accordion (only one open at a time)
    option :input_type,
      type: Collapse::InputTypes,
      default: -> { :radio }

    # Renders the accordion container element.
    #
    # @yield The content block to define accordion items.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      ul(**attrs, &)
    end

    # Renders an accordion item.
    #
    # @param (see Protos::Accordion::Item#initialize)
    # @return [nil]
    def item(*, **, &)
      render Item.new(*, input_type:, input_name:, **, &)
    end

    # Renders the accordion content section.
    #
    # @param (see Protos::Collapse::Content#initialize)
    # @return [nil]
    def content(...) = render Collapse::Content.new(...)

    # Renders the accordion title (clickable header).
    #
    # @param (see Protos::Collapse::Title#initialize)
    # @return [nil]
    def title(*, **, &)
      render Collapse::Title.new(*, input_id: @input_name, **, &)
    end

    private

    def theme
      {
        container: "join join-vertical"
      }
    end
  end
end
