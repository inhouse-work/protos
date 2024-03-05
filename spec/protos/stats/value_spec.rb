# frozen_string_literal: true

RSpec.describe Protos::Stats::Value do
  before do
    render described_class.new { "Value content" }
  end

  it "renders the component" do
    expect(page).to have_css("div")
    expect(page).to have_content("Value content")
  end

  it "renders the style" do
    expect(page).to have_css(".stat-value")
  end
end
