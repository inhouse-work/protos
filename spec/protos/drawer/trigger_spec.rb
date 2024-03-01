# frozen_string_literal: true

RSpec.describe Protos::Drawer::Trigger do
  before do
    render described_class.new(id: "some_id") { "trigger" }
  end

  it "renders the drawer sidebar" do
    expect(page).to have_css("label[for=some_id]")
    expect(page).to have_content("trigger")
  end

  it "renders the style" do
    expect(page).to have_css(".drawer-button")
  end
end
