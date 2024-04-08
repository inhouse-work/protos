# frozen_string_literal: true

RSpec.describe Protos::Card do
  subject do
    described_class.new(
      image_display: "overlay",
      border: true,
      compact: true
    ) do |card|
      card.image { card.img(src: "#") }
      card.body do
        card.title { "Hello world" }
        card.plain "This is a card"
        card.actions do
          card.button { "Action one" }
        end
      end
    end
  end

  before { render subject }

  it "renders a card with a title and body" do
    expect(page).to have_content "Hello world"
    expect(page).to have_content "This is a card"
    expect(page).to have_button "Action one"
    expect(page).to have_css "figure > img"
  end

  it "renders the daisyui styles" do
    expect(page).to have_css ".card-bordered"
    expect(page).to have_css ".card"
  end

  it "renders the configured styles" do
    expect(page).to have_css ".image-full"
  end
end
