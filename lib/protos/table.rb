# frozen_string_literal: true

module Protos
  # A table component
  #
  # @see https://daisyui.com/components/table/
  #
  # @example
  #   Protos::Table.new(size: :lg, striped: true) do |table|
  #     table.caption { "My Table Caption" }
  #     table.head do
  #       table.header { "Header 1" }
  #     end
  #     table.body do
  #       table.row do
  #         table.cell { "Row 1, Cell 1" }
  #         table.cell { "Row 1, Cell 2" }
  #       end
  #     end
  #     table.footer do
  #       table.row do
  #         table.cell { "Footer Cell" }
  #         end
  #       end
  #     end
  #   end
  class Table < Component
    autoload :Caption, "protos/table/caption"
    autoload :Header, "protos/table/header"
    autoload :Head, "protos/table/head"
    autoload :Body, "protos/table/body"
    autoload :Footer, "protos/table/footer"
    autoload :Row, "protos/table/row"
    autoload :Cell, "protos/table/cell"

    Sizes = Types::Coercible::Symbol.enum(
      :xs,
      :sm,
      :md,
      :lg
    )

    SIZES = {
      xs: "table-xs",
      sm: "table-sm",
      md: "table-md",
      lg: "table-lg"
    }.freeze

    # @!attribute [r] pin_rows
    #   @return [Boolean] Whether rows should be pinned (sticky).
    option :pin_rows, default: -> { false }, type: Types::Bool

    # @!attribute [r] pin_columns
    #   @return [Boolean] Whether columns should be pinned (sticky).
    option :pin_columns, default: -> { false }, type: Types::Bool

    # @!attribute [r] striped
    #   @return [Boolean] Whether to use zebra-striping on rows.
    option :striped, default: -> { false }, type: Types::Bool

    # @!attribute [r] size
    #   @return [Symbol] One of `:xs`, `:sm`, `:md`, or `:lg` for size.
    option :size,
      default: -> { :md },
      reader: false,
      type: Sizes

    # Renders the full table element.
    #
    # @yield The content block to define table parts like head/body.
    # @return [nil] outputs to the @buffer
    def view_template(&block)
      div(**attrs) do
        table(class: css[:table], &block)
      end
    end

    # Renders the table body.
    #
    # @param (see Protos::Table::Body#initialize)
    # @return [nil]
    def body(...) = render Body.new(...)

    # Renders a caption for the table.
    #
    # @param (see Protos::Table::Caption#initialize)
    # @return [nil]
    def caption(...) = render Caption.new(...)

    # Renders a table cell.
    #
    # @param (see Protos::Table::Cell#initialize)
    # @return [nil]
    def cell(...) = render Cell.new(...)

    # Renders the table footer.
    #
    # @param (see Protos::Table::Footer#initialize)
    # @return [nil]
    def footer(...) = render Footer.new(...)

    # Renders the table head (thead).
    #
    # @param (see Protos::Table::Head#initialize)
    # @return [nil]
    def head(...) = render Head.new(...)

    # Renders a table header row.
    #
    # @param (see Protos::Table::Header#initialize)
    # @return [nil]
    def header(...) = render Header.new(...)

    # Renders a table row.
    #
    # @param (see Protos::Table::Row#initialize)
    # @return [nil]
    def row(...) = render Row.new(...)

    private

    def size
      SIZES.fetch(@size)
    end

    def theme
      {
        container: "w-full overflow-x-auto",
        table: [
          "table",
          size,
          ("table-pin-rows" if pin_rows),
          ("table-pin-cols" if pin_columns),
          ("table-striped" if striped)
        ]
      }
    end
  end
end
