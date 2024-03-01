# frozen_string_literal: true

RSpec.describe Protos::Table::Head do
  before do
    render described_class.new { "head" }
  end

  it "renders a table heading" do
    expect(page).to have_css("th")
    expect(page).to have_content("head")
  end
end
