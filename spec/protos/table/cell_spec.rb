# frozen_string_literal: true

RSpec.describe Protos::Table::Cell do
  before do
    render described_class.new { "cell" }
  end

  it "renders the cell" do
    expect(page).to have_css("td")
    expect(page).to have_content("cell")
  end
end
