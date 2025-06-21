# frozen_string_literal: true

module Protos
  # A dropdown component is basically a popover with a specific list of
  # items in a menu. It should be preferred to a popover when the content is
  # a list of actions rather than some content in its own right.
  #
  # Dropdowns, and popovers in general, use tippy.js to position content
  # rather than pure CSS for accessibility. The layout of pure CSS was too
  # tricky to get right and we felt the dependency tradeoff was worthwhile.
  #
  # @example Basic dropdown
  #   Protos::Dropdown.new(position: :bottom) do |dropdown|
  #     dropdown.trigger { "Options" }
  #     dropdown.menu do |menu|
  #       menu.item { a(href: "/profile") { "Profile" } }
  #       menu.item { a(href: "/settings") { "Settings" } }
  #       menu.item { a(href: "/logout") { "Logout" } }
  #     end
  #   end
  #
  # @example Dropdown with custom trigger and positioning
  #   Protos::Dropdown.new(position: :right, trigger: :hover) do |dropdown|
  #     dropdown.trigger { button(class: "btn") { "Actions" } }
  #     dropdown.menu do |menu|
  #       menu.item { "Edit" }
  #       menu.item { "Delete" }
  #       menu.item { "Share" }
  #     end
  #   end
  class Dropdown < Popover
    autoload :Item, "protos/dropdown/item"
    autoload :Menu, "protos/dropdown/menu"
    autoload :Trigger, "protos/dropdown/trigger"

    # @!attribute [r] position
    #   @return [Symbol] One of `:top`, `:top_start`, `:top_end`, `:right`, `:right_start`, `:right_end`, `:bottom`, `:bottom_start`, `:bottom_end`, `:left`, `:left_start`, or `:left_end` for positioning.
    option :position,
      type: Popover::Positions,
      default: -> { :bottom },
      reader: false

    # @!attribute [r] trigger
    #   @return [Symbol, Array<Symbol>] One or more of `:focus`, `:mouseenter`, `:click`, `:focusin`, or `:manual` for trigger events.
    option :trigger,
      default: -> { :click },
      reader: false,
      type: Popover::Triggers | Types::Array.of(Popover::Triggers)

    # Renders a dropdown item.
    #
    # @param (see Protos::Dropdown::Item#initialize)
    # @return [nil]
    def item(...) = render Item.new(...)

    # Renders the dropdown menu container.
    #
    # @param (see Protos::Dropdown::Menu#initialize)
    # @return [nil]
    def menu(...) = render Menu.new(...)

    # Renders the dropdown trigger element.
    #
    # @param (see Protos::Dropdown::Trigger#initialize)
    # @return [nil]
    def trigger(...) = render Trigger.new(...)
  end
end
