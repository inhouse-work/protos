# frozen_string_literal: true

RSpec.describe Protos::Table::Row do
  before do
    render described_class.new { "row" }
  end

  it "renders the row" do
    expect(page).to have_css("tr")
    expect(page).to have_content("row")
  end

  it "renders the styles" do
    expect(page).to have_css(".print\\:break-inside-avoid")
    expect(page).to have_css(".print\\:break-after-auto")
  end
end
