# frozen_string_literal: true

module Protos
  # A breadcrumbs component for navigation hierarchy
  #
  # @see https://daisyui.com/components/breadcrumbs/
  #
  # @example Basic breadcrumbs
  #   Protos::Breadcrumbs.new do |breadcrumbs|
  #     breadcrumbs.crumb { a(href: "/") { "Home" } }
  #     breadcrumbs.crumb { a(href: "/products") { "Products" } }
  #     breadcrumbs.crumb { "Current Page" }
  #   end
  #
  # @example Breadcrumbs with custom separator
  #   Protos::Breadcrumbs.new(class: "text-sm") do |breadcrumbs|
  #     breadcrumbs.crumb { a(href: "/") { "Home" } }
  #     breadcrumbs.crumb { ">" }
  #     breadcrumbs.crumb { a(href: "/products") { "Products" } }
  #   end
  class Breadcrumbs < Component
    autoload :Crumb, "protos/breadcrumbs/crumb"

    # Renders the breadcrumbs container element.
    #
    # @yield The content block to define breadcrumb items.
    # @return [nil] outputs to the @buffer
    def view_template(&block)
      nav(**attrs) do
        ul(class: css[:list], &block)
      end
    end

    # Renders a breadcrumb item.
    #
    # @param (see Protos::Breadcrumbs::Crumb#initialize)
    # @return [nil]
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
