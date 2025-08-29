# frozen_string_literal: true

RSpec.describe Protos::Table::Footer do
  before do
    render described_class.new { "Footer" }
  end

  it "renders a footer" do
    expect(page).to have_css("tfoot")
    expect(page).to have_content("Footer")
  end

  it "renders the styles" do
    expect(page).to have_css(".table-footer-group")
  end
end
