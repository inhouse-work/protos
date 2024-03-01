# frozen_string_literal: true

RSpec.describe Protos::Timeline do
  before do
    render described_class.new(vertical: true) { "content" }
  end

  it "renders the timeline" do
    expect(page).to have_css("ul")
    expect(page).to have_content("content")
  end

  it "renders the style" do
    expect(page).to have_css(".timeline")
    expect(page).to have_css(".timeline-vertical")
  end
end
