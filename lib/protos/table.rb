# frozen_string_literal: true

module Protos
  class Table < Component
    # DOCS: A table component
    # https://daisyui.com/components/table/

    autoload :Caption, "protos/table/caption"
    autoload :Header, "protos/table/header"
    autoload :Head, "protos/table/head"
    autoload :Body, "protos/table/body"
    autoload :Footer, "protos/table/footer"
    autoload :Row, "protos/table/row"
    autoload :Cell, "protos/table/cell"

    SIZES = {
      xs: "table-xs",
      sm: "table-sm",
      md: "table-md",
      lg: "table-lg"
    }.freeze

    option :pin_rows, default: -> { false }, type: Types::Bool
    option :pin_columns, default: -> { false }, type: Types::Bool
    option :striped, default: -> { false }, type: Types::Bool
    option :size,
           default: -> { :md },
           reader: false,
           type: Types::Coercible::Symbol.enum(
             :xs,
             :sm,
             :md,
             :lg
           )

    def view_template(&block)
      div(**attrs) do
        table(class: css[:table], &block)
      end
    end

    def body(...) = render Body.new(...)

    def caption(...) = render Caption.new(...)

    def cell(...) = render Cell.new(...)

    def footer(...) = render Footer.new(...)

    def head(...) = render Head.new(...)

    def header(...) = render Header.new(...)

    def row(...) = render Row.new(...)

    private

    def size
      SIZES.fetch(@size)
    end

    def theme
      {
        container: "w-full overflow-x-auto",
        table: tokens(
          "table",
          size,
          pin_rows: "table-pin-rows",
          pin_columns: "table-pin-columns",
          striped: "table-striped"
        )
      }
    end
  end
end
