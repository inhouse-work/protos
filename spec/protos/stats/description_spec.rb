# frozen_string_literal: true

RSpec.describe Protos::Stats::Description do
  before do
    render described_class.new { "Description content" }
  end

  it "renders the component" do
    expect(page).to have_css("div")
    expect(page).to have_content("Description content")
  end

  it "renders the style" do
    expect(page).to have_css(".stat-desc")
  end
end
