# frozen_string_literal: true

RSpec.describe Protos::Card do
  before do
    render described_class.new(
      image_display: "overlay",
      border: true,
      compact: true
    ) { "Hello world" }
  end

  it "renders a card with a title and body" do
    expect(page).to have_content "Hello world"
  end

  it "renders the daisyui styles" do
    expect(page).to have_css ".card-bordered"
    expect(page).to have_css ".card"
  end

  it "renders the configured styles" do
    expect(page).to have_css ".image-full"
  end
end
