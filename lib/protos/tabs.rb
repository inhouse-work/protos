# frozen_string_literal: true

module Protos
  # A tabs component
  #
  # @see https://daisyui.com/components/tab/
  #
  # @example
  #   Protos::Tabs.new(type: :boxed, size: :lg) do |tabs|
  #     tabs.tab(active: true) { "Tab 1" }
  #     tabs.tab { "Tab 2" }
  #     tabs.tab(disabled: true) { "Tab 3" }
  #   end
  class Tabs < Component
    autoload :Tab, "protos/tabs/tab"

    Styles = Types::Coercible::Symbol.enum(
      :default,
      :boxed,
      :bordered,
      :lifted
    )

    Sizes = Types::Coercible::Symbol.enum(
      :xs,
      :sm,
      :md,
      :lg
    )

    STYLES = {
      default: "",
      bordered: "tabs-bordered",
      boxed: "tabs-boxed",
      lifted: "tabs-lifted"
    }.freeze

    SIZES = {
      xs: "tabs-xs",
      sm: "tabs-sm",
      md: "tabs-md",
      lg: "tabs-lg"
    }.freeze

    # @!attribute [r] type
    #   @return [Symbol] One of:
    #     - `:default`
    #     - `:boxed`
    #     - `:bordered`
    #     - `:lifted`
    option :type,
      default: -> { :default },
      reader: false,
      type: Styles

    # @!attribute [r] size
    #   @return [Symbol] One of `:xs`, `:sm`, `:md`, or `:lg` for size.
    option :size,
      default: -> { :md },
      reader: false,
      type: Sizes

    # Renders the full tabs element.
    #
    # @yield The content block to define individual tabs.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      div(**attrs, &)
    end

    # Renders a tab.
    #
    # @param (see Protos::Tabs::Tab#initialize)
    # @return [nil]
    def tab(...) = render Tab.new(...)

    private

    def size
      SIZES.fetch(@size)
    end

    def type
      STYLES.fetch(@type)
    end

    def default_attrs
      {
        role: :tablist
      }
    end

    def theme
      {
        container: %W[
          tabs
          #{size}
          #{type}
        ]
      }
    end
  end
end
