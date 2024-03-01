# frozen_string_literal: true

RSpec.describe Protos::Dropdown::Menu do
  before do
    render described_class.new { "menu" }
  end

  it "renders the menu" do
    expect(page).to have_css("ul")
    expect(page).to have_content("menu")
  end

  it "renders the styles" do
    expect(page).to have_css(".menu")
    expect(page).to have_css(".dropdown-content")
  end
end
