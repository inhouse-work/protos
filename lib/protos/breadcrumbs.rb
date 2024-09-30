# frozen_string_literal: true

module Protos
  class Breadcrumbs < Component
    # DOCS: A list of breadcrumbs (e.g links) for navigation
    # https://daisyui.com/components/breadcrumbs/

    autoload :Crumb, "protos/breadcrumbs/crumb"

    def view_template(&block)
      nav(**attrs) do
        ul(class: css[:list], &block)
      end
    end

    def crumb(...) = render Crumb.new(...)

    private

    def default_attrs
      {
        aria_label: "breadcrumbs"
      }
    end

    def theme
      {
        container: "breadcrumbs"
      }
    end
  end
end
