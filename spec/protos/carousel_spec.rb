# frozen_string_literal: true

RSpec.describe Protos::Carousel do
  before do
    render described_class.new(
      vertical: true,
      snap_to: :end
    ) { "Carousel content" }
  end

  it "renders a carousel" do
    expect(page).to have_css("div")
    expect(page).to have_content("Carousel content")
  end

  it "renders the style" do
    expect(page).to have_css(".carousel")
    expect(page).to have_css(".carousel-vertical")
    expect(page).to have_css(".carousel-end")
  end
end
