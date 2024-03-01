# frozen_string_literal: true

RSpec.describe Protos::Table do
  before do
    render described_class.new
  end

  it "renders a table" do
    expect(page).to have_table
  end

  it "renders the style" do
    expect(page).to have_css(".table")
    expect(page).to have_css(".overflow-x-auto")
    expect(page).to have_css(".w-full")
  end
end
