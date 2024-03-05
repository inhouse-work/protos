# frozen_string_literal: true

RSpec.describe Protos::Stats::Title do
  before do
    render described_class.new { "Title content" }
  end

  it "renders the component" do
    expect(page).to have_css("div")
    expect(page).to have_content("Title content")
  end

  it "renders the style" do
    expect(page).to have_css(".stat-title")
  end
end
