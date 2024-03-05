# frozen_string_literal: true

RSpec.describe Protos::Tabs do
  before do
    render described_class.new(type: :lifted, size: :lg) { "Tabs content" }
  end

  it "renders a tabs" do
    expect(page).to have_css("div[role='tablist']")
    expect(page).to have_content("Tabs content")
  end

  it "renders the style" do
    expect(page).to have_css(".tabs")
    expect(page).to have_css(".tabs-lifted")
    expect(page).to have_css(".tabs-lg")
  end
end
