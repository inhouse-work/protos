# frozen_string_literal: true

module Protos
  class Hero < Component
    def template(&block)
      div(**attrs, &block)
    end

    def content(...)
      Content.new(...)
    end

    def overlay(...)
      Overlay.new(...)
    end

    private

    def theme
      {
        container: tokens("hero")
      }
    end
  end
end
