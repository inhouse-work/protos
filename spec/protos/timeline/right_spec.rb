# frozen_string_literal: true

RSpec.describe Protos::Timeline::Right do
  before do
    render described_class.new { "content" }
  end

  it "renders the right" do
    expect(page).to have_css("div")
    expect(page).to have_content("content")
  end

  it "renders the style" do
    expect(page).to have_css(".timeline-end")
  end
end
