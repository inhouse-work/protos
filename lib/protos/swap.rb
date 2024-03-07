# frozen_string_literal: true

module Protos
  class Swap < Component
    def template
      label(**attrs) do
        input(type: :checkbox, class: css[:input])
        yield if block_given?
      end
    end

    def on(...)
      On.new(...)
    end

    def off(...)
      Off.new(...)
    end

    private

    def theme
      {
        container: tokens("swap"),
        input: tokens("hidden")
      }
    end
  end
end
