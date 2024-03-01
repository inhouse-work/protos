# frozen_string_literal: true

RSpec.describe Protos::Popover do
  before do
    render described_class.new(position: :top)
  end

  it "renders the popover" do
    expect(page).to have_css("details")
  end

  it "renders the style" do
    expect(page).to have_css(".dropdown")
    expect(page).to have_css(".dropdown-top")
  end
end
