# frozen_string_literal: true

RSpec.describe Protos::Drawer::Content do
  before do
    render described_class.new { "drawer" }
  end

  it "renders the drawer sidebar" do
    expect(page).to have_css("div")
    expect(page).to have_content("drawer")
  end

  it "renders the style" do
    expect(page).to have_css(".drawer-content")
  end
end
