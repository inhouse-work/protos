# frozen_string_literal: true

module Protos
  # A combobox is a combination of a text input and a list of options.
  # It makes selecting values from a large list easier by filtering the list.
  # Comboboxes use popovers and command to create the list of options.
  #
  # @example Basic combobox
  #   Protos::Combobox.new(position: :bottom) do |combobox|
  #     combobox.trigger { input(type: :text, placeholder: "Select option...") }
  #     combobox.content do
  #       combobox.list do
  #         combobox.item { "Option 1" }
  #         combobox.item { "Option 2" }
  #         combobox.item { "Option 3" }
  #       end
  #     end
  #   end
  #
  # @example Combobox with groups and search
  #   Protos::Combobox.new do |combobox|
  #     combobox.trigger { input(type: :text, placeholder: "Search users...") }
  #     combobox.content do
  #       combobox.input { icon("search") }
  #       combobox.list do
  #         combobox.group do
  #           combobox.title { "Admins" }
  #           combobox.item { "John Doe" }
  #           combobox.item { "Jane Smith" }
  #         end
  #         combobox.group do
  #           combobox.title { "Users" }
  #           combobox.item { "Bob Johnson" }
  #           combobox.item { "Alice Brown" }
  #         end
  #         combobox.empty { "No users found." }
  #       end
  #     end
  #   end
  class Combobox < Popover

    # @!attribute [r] trigger
    #   @return [Symbol, Array<Symbol>] One or more of `:focus`, `:mouseenter`, `:click`, `:focusin`, or `:manual` for trigger events.
    option :trigger,
      default: -> { :click },
      reader: false,
      type: Popover::Triggers | Types::Array.of(Popover::Triggers)

    # Renders the combobox trigger element.
    #
    # @param (see Protos::Popover::Trigger#initialize)
    # @return [nil]
    def trigger(...) = render Popover::Trigger.new(...)

    # Renders the combobox content container.
    #
    # @param (see Protos::Popover::Content#initialize)
    # @return [nil]
    def content(...) = render Popover::Content.new(...)

    # Renders the combobox input field for filtering.
    #
    # @param (see Protos::Command::Input#initialize)
    # @return [nil]
    def input(...) = render Command::Input.new(...)

    # Renders a combobox group container.
    #
    # @param (see Protos::Command::Group#initialize)
    # @return [nil]
    def group(...) = render Command::Group.new(...)

    # Renders a combobox item.
    #
    # @param (see Protos::Command::Item#initialize)
    # @return [nil]
    def item(...) = render Command::Item.new(...)

    # Renders the combobox list container.
    #
    # @param (see Protos::Command::List#initialize)
    # @return [nil]
    def list(...) = render Command::List.new(...)

    # Renders a title for a combobox group.
    #
    # @param (see Protos::Command::Title#initialize)
    # @return [nil]
    def title(...) = render Command::Title.new(...)

    # Renders the empty state when no options match.
    #
    # @param (see Protos::Command::Empty#initialize)
    # @return [nil]
    def empty(...) = render Command::Empty.new(...)

    private

    def default_attrs
      {
        data: {
          controller: "protos--popover",
          "protos--popover-options-value": JSON.generate(options)
        }
      }
    end
  end
end
