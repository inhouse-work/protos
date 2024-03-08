# frozen_string_literal: true

RSpec.describe Protos::Table do
  before do
    render described_class.new(
      pin_rows: true,
      pin_columns: true,
      striped: true,
      size: :lg
    )
  end

  it "renders a table" do
    expect(page).to have_table
  end

  it "renders the style" do
    expect(page).to have_css(".table")
    expect(page).to have_css(".overflow-x-auto")
    expect(page).to have_css(".w-full")
    expect(page).to have_css(".table-lg")
    expect(page).to have_css(".table-pin-rows")
    expect(page).to have_css(".table-pin-columns")
  end
end
