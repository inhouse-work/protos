# frozen_string_literal: true

module Protos
  class Diff < Component
    autoload :Item, "protos/diff/item"
    autoload :Resizer, "protos/diff/resizer"

    def view_template(&)
      figure(**attrs, &)
    end

    def item_one(*, **, &) = render Item.new(*, order: :one, **, &)
    def item_two(*, **, &) = render Item.new(*, order: :two, **, &)
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
