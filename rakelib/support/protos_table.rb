# frozen_string_literal: true

class ProtosTable < Protos::Component
  def view_template
    render Protos::Table.new do |table|
      table.header do
        table.row do
          table.head { "Name" }
          table.head { "Age" }
        end
      end

      table.body do
        100.times do |i|
          table.row do
            table.cell { "John Doe" }
            table.cell { i }
          end
        end
      end

      table.footer do
        table.row do
          table.cell { "Total" }
          table.cell { 100 }
        end
      end
    end
  end
end
