# frozen_string_literal: true

RSpec.describe Protos::Table::Header do
  before do
    render described_class.new { "header" }
  end

  it "renders a header" do
    expect(page).to have_css("thead")
    expect(page).to have_content("header")
  end

  it "renders the styles" do
    expect(page).to have_css(".table-header-group")
  end
end
