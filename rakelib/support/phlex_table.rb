# frozen_string_literal: true

class PhlexTable < Phlex::HTML
  def view_template # rubocop:disable Metrics/MethodLength
    table do
      thead do
        tr do
          th { "Name" }
          th { "Age" }
        end
      end

      tbody do
        100.times do |i|
          tr do
            td { "John Doe" }
            td { i }
          end
        end
      end

      tfoot do
        tr do
          td { "Total" }
          td { 100 }
        end
      end
    end
  end
end
