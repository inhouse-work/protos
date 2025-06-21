# frozen_string_literal: true

module Protos
  # A diff component for comparing two items side by side with a resizable divider
  #
  # @example Basic diff comparison
  #   Protos::Diff.new do |diff|
  #     diff.item_one do
  #       img(src: "image1.jpg", alt: "Before")
  #     end
  #     diff.resizer
  #     diff.item_two do
  #       img(src: "image2.jpg", alt: "After")
  #     end
  #   end
  #
  # @example Text diff comparison
  #   Protos::Diff.new do |diff|
  #     diff.item_one do
  #       div(class: "p-4") do
  #         h3 { "Original Text" }
  #         p { "This is the original content." }
  #       end
  #     end
  #     diff.resizer
  #     diff.item_two do
  #       div(class: "p-4") do
  #         h3 { "Modified Text" }
  #         p { "This is the modified content." }
  #       end
  #     end
  #   end
  class Diff < Component
    autoload :Item, "protos/diff/item"
    autoload :Resizer, "protos/diff/resizer"

    # Renders the diff container element.
    #
    # @yield The content block to define diff items and resizer.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      figure(**attrs, &)
    end

    # Renders the first item in the diff comparison.
    #
    # @param (see Protos::Diff::Item#initialize)
    # @return [nil]
    def item_one(*, **, &) = render Item.new(*, order: :one, **, &)

    # Renders the second item in the diff comparison.
    #
    # @param (see Protos::Diff::Item#initialize)
    # @return [nil]
    def item_two(*, **, &) = render Item.new(*, order: :two, **, &)

    # Renders the resizer element that allows dragging to adjust the split.
    #
    # @param (see Protos::Diff::Resizer#initialize)
    # @return [nil]
    def resizer(...) = render Resizer.new(...)

    private

    def default_attrs
      {
        tabindex: 0
      }
    end

    def theme
      {
        container: "diff"
      }
    end
  end
end
