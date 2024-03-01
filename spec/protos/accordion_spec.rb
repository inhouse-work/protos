# frozen_string_literal: true

RSpec.describe Protos::Accordion do
  before do
    render described_class.new { "Item 1" }
  end

  it "renders the block" do
    expect(page).to have_content "Item 1"
  end

  it "renders the styles" do
    expect(page).to have_css ".join"
    expect(page).to have_css ".join-vertical"
  end
end
