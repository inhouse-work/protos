# frozen_string_literal: true

module Protos
  # A command palette component that can be used to trigger a modal with
  # filterable list of commands. Command modals are by default closable by
  # clicking the overlay rather than a specific close button.
  #
  # @example Basic command palette
  #   render Protos::Command.new do |command|
  #     command.trigger { "Open Command Palette" }
  #     command.dialog do
  #       command.input { icon("search") }
  #       command.list do
  #         command.group do
  #           command.title { "Navigation" }
  #           command.item { a(href: "/dashboard") { "Dashboard" } }
  #           command.item { a(href: "/settings") { "Settings" } }
  #         end
  #         command.empty { "No results found." }
  #       end
  #     end
  #   end
  #
  # @example Command palette with custom placeholder
  #   render Protos::Command.new do |command|
  #     command.trigger { button(class: "btn") { "⌘K" } }
  #     command.dialog do
  #       command.input(placeholder: "Search commands...") { icon("search") }
  #       command.list do
  #         command.item { "Create new file" }
  #         command.item { "Open recent" }
  #         command.item { "Toggle sidebar" }
  #       end
  #     end
  #   end
  class Command < Component
    autoload :Input, "protos/command/input"
    autoload :Dialog, "protos/command/dialog"
    autoload :Group, "protos/command/group"
    autoload :List, "protos/command/list"
    autoload :Trigger, "protos/command/trigger"
    autoload :Title, "protos/command/title"
    autoload :Item, "protos/command/item"
    autoload :Empty, "protos/command/empty"

    # Renders the command palette container element.
    #
    # @yield The content block to define trigger and dialog.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      div(**attrs, &)
    end

    # Renders the command input field.
    #
    # @param (see Protos::Command::Input#initialize)
    # @return [nil]
    def input(...) = render Command::Input.new(...)

    # Renders the command list container.
    #
    # @param (see Protos::Command::List#initialize)
    # @return [nil]
    def list(...) = render Command::List.new(...)

    # Renders the command trigger element.
    #
    # @param (see Protos::Command::Trigger#initialize)
    # @return [nil]
    def trigger(...) = render Command::Trigger.new(...)

    # Renders the command dialog.
    #
    # @param (see Protos::Modal::Dialog#initialize)
    # @return [nil]
    def dialog(...) = render Modal::Dialog.new(...)

    # Renders a close button for the command dialog.
    #
    # @param (see Protos::Modal::CloseButton#initialize)
    # @return [nil]
    def close_button(...) = render Modal::CloseButton.new(...)

    # Renders a title for a command group.
    #
    # @param (see Protos::Command::Title#initialize)
    # @return [nil]
    def title(...) = render Command::Title.new(...)

    # Renders a command group container.
    #
    # @param (see Protos::Command::Group#initialize)
    # @return [nil]
    def group(...) = render Command::Group.new(...)

    # Renders a command item.
    #
    # @param (see Protos::Command::Item#initialize)
    # @return [nil]
    def item(...) = render Command::Item.new(...)

    # Renders the empty state when no commands match.
    #
    # @param (see Protos::Command::Empty#initialize)
    # @return [nil]
    def empty(...) = render Command::Empty.new(...)

    private

    def default_attrs
      {
        data: {
          controller: "protos--modal",
          action: "click->protos--modal#backdropClose"
        }
      }
    end
  end
end
