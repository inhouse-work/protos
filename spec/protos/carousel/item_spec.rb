# frozen_string_literal: true

RSpec.describe Protos::Carousel::Item do
  before do
    render described_class.new { "Carousel item content" }
  end

  it "renders a carousel item" do
    expect(page).to have_css("div")
    expect(page).to have_content("Carousel item content")
  end

  it "renders the style" do
    expect(page).to have_css(".carousel-item")
  end
end
