# frozen_string_literal: true

module Protos
  class Drawer < Component
    option :id, type: Types::Coercible::String

    def template
      div(**attrs) do
        input(id:, type: :checkbox, class: css[:toggle])
        yield if block_given?
      end
    end

    def content(...)
      Content.new(...)
    end

    def side(*args, **kwargs, &block)
      Side.new(*args, id:, **kwargs, &block)
    end

    def trigger(*args, **kwargs, &block)
      Trigger.new(*args, id:, **kwargs, &block)
    end

    private

    def style
      {
        container: tokens("drawer"),
        toggle: tokens("drawer-toggle")
      }
    end
  end
end
