# frozen_string_literal: true

module Protos
  class Tabs < Component
    option :type,
           default: -> { :default },
           reader: false,
           type: Types::Coercible::Symbol.enum(
             :default,
             :boxed,
             :bordered,
             :lifted
           )
    option :size,
           default: -> { :md },
           reader: false,
           type: Types::Coercible::Symbol.enum(
             :xs,
             :sm,
             :md,
             :lg
           )

    def template(&block)
      div(**attrs, &block)
    end

    def tab(...)
      Tab.new(...)
    end

    private

    def size
      {
        xs: "tabs-xs",
        sm: "tabs-sm",
        md: "tabs-md",
        lg: "tabs-lg"
      }.fetch(@size)
    end

    def type
      {
        bordered: "tabs-bordered",
        boxed: "tabs-boxed",
        lifted: "tabs-lifted",
        default: ""
      }.fetch(@type)
    end

    def default_attrs
      {
        role: :tablist
      }
    end

    def theme
      {
        container: tokens("tabs", size, type)
      }
    end
  end
end
