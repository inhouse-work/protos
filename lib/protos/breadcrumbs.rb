# frozen_string_literal: true

module Protos
  class Breadcrumbs < Component
    def template(&block)
      nav(**attrs) do
        ul(class: css[:list], &block)
      end
    end

    def crumb(...)
      Crumb.new(...)
    end

    private

    def theme
      {
        container: tokens("breadcrumbs")
      }
    end
  end
end
