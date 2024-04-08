# frozen_string_literal: true

RSpec.describe Protos::Carousel do
  subject do
    described_class.new(
      vertical: true,
      snap_to: :end
    ) do |carousel|
      carousel.item { "Item one" }
      carousel.item { "Item two" }
      carousel.actions do
        carousel.button { "Previous" }
        carousel.button { "Next" }
      end
    end
  end

  before { render subject }

  it "renders a carousel" do
    expect(page).to have_css("div")
    expect(page).to have_content("Item one")
    expect(page).to have_content("Item two")
    expect(page).to have_button("Previous")
    expect(page).to have_button("Next")
  end

  it "renders the style" do
    expect(page).to have_css(".carousel")
    expect(page).to have_css(".carousel-vertical")
    expect(page).to have_css(".carousel-end")
  end
end
