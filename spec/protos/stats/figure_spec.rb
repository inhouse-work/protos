# frozen_string_literal: true

RSpec.describe Protos::Stats::Figure do
  before do
    render described_class.new { "Figure content" }
  end

  it "renders the component" do
    expect(page).to have_css("div")
    expect(page).to have_content("Figure content")
  end

  it "renders the style" do
    expect(page).to have_css(".stat-figure")
  end
end
