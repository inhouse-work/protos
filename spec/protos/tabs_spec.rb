# frozen_string_literal: true

RSpec.describe Protos::Tabs do
  subject do
    described_class.new(type: :lifted, size: :lg) do |tabs|
      tabs.tab(id: "tabs", label: "Tab 1") { "Tab 1 content" }
      tabs.tab(id: "tabs", label: "Tab 2") { "Tab 2 content" }
    end
  end

  before { render subject }

  it "renders a tabs" do
    expect(page).to have_css("div[role='tablist']")
    expect(page).to have_css("input[type=radio][name='tabs'][aria-label='Tab 1']")
    expect(page).to have_css("input[type=radio][name='tabs'][aria-label='Tab 2']")
    expect(page).to have_content("Tab 1 content")
    expect(page).to have_content("Tab 2 content")
  end

  it "renders the style" do
    expect(page).to have_css(".tabs")
    expect(page).to have_css(".tabs-lifted")
    expect(page).to have_css(".tabs-lg")
  end
end
