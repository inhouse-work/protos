# frozen_string_literal: true

RSpec.describe Protos::Typography::Heading do
  before do
    render described_class.new
  end

  it "renders the heading" do
    expect(page).to have_css("h1")
    expect(page).to have_css(".text-2xl")
    expect(page).to have_css(".font-semibold")
    expect(page).to have_css(".scroll-m-20")
    expect(page).to have_css(".tracking-tight")
    expect(page).to have_css(".transition-colors")
  end
end
