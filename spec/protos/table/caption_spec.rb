# frozen_string_literal: true

RSpec.describe Protos::Table::Caption do
  before do
    render described_class.new { "Caption" }
  end

  it "renders a caption" do
    expect(page).to have_css("caption")
    expect(page).to have_content("Caption")
  end

  it "renders the style" do
    expect(page).to have_css(".caption-bottom")
    expect(page).to have_css(".p-sm")
  end
end
