# frozen_string_literal: true

RSpec.describe Protos::Table::Row do
  before do
    render described_class.new { "row" }
  end

  it "renders the row" do
    expect(page).to have_css("tr")
    expect(page).to have_content("row")
  end
end
