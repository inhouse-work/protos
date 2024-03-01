# frozen_string_literal: true

RSpec.describe Protos::Timeline::Center do
  before do
    render described_class.new { "content" }
  end

  it "renders the center" do
    expect(page).to have_css("div")
    expect(page).to have_content("content")
  end

  it "renders the style" do
    expect(page).to have_css(".timeline-middle")
  end
end
