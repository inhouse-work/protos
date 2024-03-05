# frozen_string_literal: true

RSpec.describe Protos::Carousel do
  before do
    render described_class.new { "Carousel content" }
  end

  it "renders a carousel" do
    expect(page).to have_css("div")
    expect(page).to have_content("Carousel content")
  end

  it "renders the style" do
    expect(page).to have_css(".carousel")
  end
end
