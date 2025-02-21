# frozen_string_literal: true

RSpec.describe Protos::Avatar do
  subject do
    described_class.new(
      placeholder: true,
      shape: :circle,
      indicator: :online
    ) do |avatar|
      avatar.plain "NT"
    end
  end

  before { render subject }

  it "renders an avatar" do
    expect(page).to have_css("div")
    expect(page).to have_css("div > div")
    expect(page).to have_content("NT")
  end

  it "displays the indicator" do
    expect(page).to have_css(".avatar-online")
  end

  it "renders the image mask" do
    expect(page).to have_css(".mask")
    expect(page).to have_css(".mask-circle")
  end

  it "renders the style" do
    expect(page).to have_css(".avatar")
    expect(page).to have_css(".placeholder")
  end
end
