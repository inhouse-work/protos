# frozen_string_literal: true

RSpec.describe Protos::Table do
  subject do
    described_class.new(
      pin_rows: true,
      pin_columns: true,
      striped: true,
      size: :lg
    ) do |table|
      table.caption { "Table caption" }
      table.header do
        table.row do
          table.head { "Name" }
          table.head { "Age" }
        end
      end

      table.body do
        table.row do
          table.cell { "John" }
          table.cell { "25" }
        end
      end

      table.footer do
        table.row do
          table.cell(colspan: 2) { "Footer" }
        end
      end
    end
  end

  before { render subject }

  it "renders a table" do
    expect(page).to have_table
    expect(page).to have_css("caption")
    expect(page).to have_css("thead")
    expect(page).to have_css("tbody")
    expect(page).to have_css("tfoot")
    expect(page).to have_css("tr", count: 3)
    expect(page).to have_css("th", count: 2)
    expect(page).to have_css("td", count: 3)
    expect(page).to have_content("Table caption")
    expect(page).to have_content("Name")
    expect(page).to have_content("Age")
    expect(page).to have_content("John")
    expect(page).to have_content("25")
  end

  it "renders the style" do
    expect(page).to have_css(".table")
    expect(page).to have_css(".overflow-x-auto")
    expect(page).to have_css(".w-full")
    expect(page).to have_css(".table-lg")
    expect(page).to have_css(".table-pin-rows")
    expect(page).to have_css(".table-pin-cols")
  end
end
