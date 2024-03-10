# frozen_string_literal: true

module Protos
  class Table < Component
    # DOCS: A table component
    # https://daisyui.com/components/table/

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

    def template(&block)
      div(**attrs) do
        table(class: css[:table], &block)
      end
    end

    def body(...)
      Body.new(...)
    end

    def caption(...)
      Caption.new(...)
    end

    def cell(...)
      Cell.new(...)
    end

    def footer(...)
      Footer.new(...)
    end

    def head(...)
      Head.new(...)
    end

    def header(...)
      Header.new(...)
    end

    def row(...)
      Row.new(...)
    end

    private

    def size
      {
        xs: "table-xs",
        sm: "table-sm",
        md: "table-md",
        lg: "table-lg"
      }.fetch(@size)
    end

    def theme
      {
        container: tokens("w-full", "overflow-x-auto"),
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
