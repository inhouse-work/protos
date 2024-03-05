# frozen_string_literal: true

RSpec.describe Protos::Hero do
  before do
    render described_class.new { "Hero content" }
  end

  it "renders the component" do
    expect(page).to have_css("div")
    expect(page).to have_content("Hero content")
  end

  it "renders the style" do
    expect(page).to have_css(".hero")
  end
end
