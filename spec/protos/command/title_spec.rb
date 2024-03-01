# frozen_string_literal: true

RSpec.describe Protos::Command::Title do
  before do
    render described_class.new { "Title" }
  end

  it "renders the item" do
    expect(page).to have_content("Title")
  end

  it "renders the style" do
    expect(page).to have_css(".menu-title")
  end
end
