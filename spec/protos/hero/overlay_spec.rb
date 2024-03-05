# frozen_string_literal: true

RSpec.describe Protos::Hero::Overlay do
  before do
    render described_class.new
  end

  it "renders the component" do
    expect(page).to have_css("div")
  end

  it "renders the style" do
    expect(page).to have_css(".hero-overlay")
  end
end
