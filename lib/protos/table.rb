# frozen_string_literal: true

module Protos
  class Table < Component
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

    def theme
      {
        container: tokens("w-full", "overflow-x-auto"),
        table: tokens("table")
      }
    end
  end
end
