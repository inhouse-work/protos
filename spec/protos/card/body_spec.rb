# frozen_string_literal: true

RSpec.describe Protos::Card::Body do
  before do
    render described_class.new { "Content" }
  end

  it "renders the body" do
    expect(page).to have_css("div")
    expect(page).to have_content("Content")
  end

  it "renders the style" do
    expect(page).to have_css(".card-body")
  end
end
