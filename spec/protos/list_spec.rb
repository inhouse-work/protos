# frozen_string_literal: true

RSpec.describe Protos::List do
  before do
    render described_class.new { "content" }
  end

  it "renders the list" do
    expect(page).to have_css("ul")
    expect(page).to have_content("content")
  end

  it "renders the style" do
    expect(page).to have_css(".join")
    expect(page).to have_css(".join-vertical")
  end
end
