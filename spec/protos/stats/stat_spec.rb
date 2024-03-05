# frozen_string_literal: true

RSpec.describe Protos::Stats::Stat do
  before do
    render described_class.new { "Stat content" }
  end

  it "renders the component" do
    expect(page).to have_css("div")
    expect(page).to have_content("Stat content")
  end

  it "renders the style" do
    expect(page).to have_css(".stat")
  end
end
