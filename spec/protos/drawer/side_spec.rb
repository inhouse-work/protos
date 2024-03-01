# frozen_string_literal: true

RSpec.describe Protos::Drawer::Side do
  before do
    render described_class.new(id: "some_id") { "drawer" }
  end

  it "renders the drawer sidebar" do
    expect(page).to have_css("aside")
    expect(page).to have_content("drawer")
  end

  it "renders the overlay" do
    expect(page).to have_css("label[for=some_id]")
  end

  it "renders the style" do
    expect(page).to have_css(".drawer-side")
    expect(page).to have_css(".drawer-overlay")
  end
end
