# frozen_string_literal: true

RSpec.describe Protos::Carousel::Actions do
  before do
    render described_class.new { "Action content" }
  end

  it "renders a carousel item actions" do
    expect(page).to have_css("div")
    expect(page).to have_content("Action content")
  end

  it "renders the style" do
    expect(page).to have_css(".absolute")
  end
end
