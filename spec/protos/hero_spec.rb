# frozen_string_literal: true

RSpec.describe Protos::Hero do
  subject do
    described_class.new(
      style: "background-image: url('https://example.com/image.jpg')"
    ) do |hero|
      hero.overlay(class: "opacity-90")
      hero.content { "Hero content" }
    end
  end

  before { render subject }

  it "renders the component" do
    expect(page).to have_css("div[style*='background-image']")
    expect(page).to have_content("Hero content")
  end

  it "renders the style" do
    expect(page).to have_css(".hero")
    expect(page).to have_css(".opacity-90")
  end
end
