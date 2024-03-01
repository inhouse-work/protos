# frozen_string_literal: true

RSpec.describe Protos::Drawer do
  before do
    render described_class.new(id: "some_id") { "drawer" }
  end

  it "renders the drawer container" do
    expect(page).to have_css("div")
    expect(page).to have_content("drawer")
  end

  it "renders the style" do
    expect(page).to have_css(".drawer")
  end
end
