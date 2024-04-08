# frozen_string_literal: true

RSpec.describe Protos::Tabs::Tab do
  before do
    render described_class.new(
      id: "tab_1",
      label: "Tab 1",
      disabled: true,
      active: true
    ) { "Tab content" }
  end

  it "renders a tab" do
    expect(page).to have_css("input[type=radio][name=tab_1][aria-label='Tab 1']")
    expect(page).to have_css("div[role=tabpanel]")
  end

  it "renders the style" do
    expect(page).to have_css(".tab")
    expect(page).to have_css(".tab-content")
    expect(page).to have_css(".tab-disabled")
    expect(page).to have_css(".tab-active")
  end
end
