# frozen_string_literal: true

module Protos
  class Tabs < Component
    # DOCS: A component that contains many Protos::Tab components
    # https://daisyui.com/components/tab/

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
      bordered: "tabs-bordered",
      boxed: "tabs-boxed",
      lifted: "tabs-lifted",
      default: ""
    }.freeze

    SIZES = {
      xs: "tabs-xs",
      sm: "tabs-sm",
      md: "tabs-md",
      lg: "tabs-lg"
    }.freeze

    option :type,
      default: -> { :default },
      reader: false,
      type: Styles
    option :size,
      default: -> { :md },
      reader: false,
      type: Sizes

    def view_template(&)
      div(**attrs, &)
    end

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
