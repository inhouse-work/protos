# frozen_string_literal: true

module Protos
  class Breadcrumbs < Component
    # DOCS: A list of breadcrumbs (e.g links) for navigation
    # https://daisyui.com/components/breadcrumbs/

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
