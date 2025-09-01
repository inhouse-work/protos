# frozen_string_literal: true

module Protos
  # A hero component for a page. It will center the content and
  # optionally layout an image for a responsive layout.
  #
  # @see https://daisyui.com/components/hero/
  #
  # @example Basic hero with content
  #   Protos::Hero.new do |hero|
  #     hero.content do
  #       div(class: "text-center") do
  #         h1(class: "text-5xl font-bold") { "Hello there" }
  #         p(class: "py-6") { "Provident cupiditate voluptatem et in." }
  #         button(class: "btn btn-primary") { "Get Started" }
  #       end
  #     end
  #   end
  #
  # @example Hero with background image and overlay
  #   Protos::Hero.new(
  #     style: "background-image: url(
  #       https://img.daisyui.com/images/stock/photo-123.jpg
  #     );"
  #   ) do |hero|
  #     hero.overlay(class: "bg-opacity-60")
  #     hero.content do
  #       div(class: "text-center text-neutral-content") do
  #         h1(class: "mb-5 text-5xl font-bold") { "Hello there" }
  #         p(class: "mb-5") { "Provident cupiditate voluptatem et in." }
  #         button(class: "btn btn-primary") { "Get Started" }
  #       end
  #     end
  #   end
  class Hero < Component
    autoload :Content, "protos/hero/content"
    autoload :Overlay, "protos/hero/overlay"

    # Renders the hero container element.
    #
    # @yield The content block to define hero content and overlay.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      div(**attrs, &)
    end

    # Renders the hero content area.
    #
    # @param (see Protos::Hero::Content#initialize)
    # @return [nil]
    def content(...) = render Content.new(...)

    # Renders an overlay for the hero (useful with background images).
    #
    # @param (see Protos::Hero::Overlay#initialize)
    # @return [nil]
    def overlay(...) = render Overlay.new(...)

    private

    def theme
      {
        container: "hero"
      }
    end
  end
end
