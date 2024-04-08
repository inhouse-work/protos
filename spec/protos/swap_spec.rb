# frozen_string_literal: true

RSpec.describe Protos::Swap do
  subject do
    described_class.new do |swap|
      swap.on { "Swap on" }
      swap.off { "Swap off" }
    end
  end

  before { render subject }

  it "renders a swap" do
    expect(page).to have_css("label")
    expect(page).to have_field(type: :checkbox)
    expect(page).to have_content("Swap on")
    expect(page).to have_content("Swap off")
  end

  it "renders the style" do
    expect(page).to have_css(".swap")
  end
end
