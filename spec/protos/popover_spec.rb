# frozen_string_literal: true

RSpec.describe Protos::Popover do
  before do
    render described_class.new(
      position: :top,
      animation: :shift_away,
      duration: [200, 200],
      hide_on_click: :toggle,
      z_index: 10
    )
  end

  it "renders the popover" do
    expect(page).to have_css("div")
  end

  it "connects the stimulus controller" do
    options = JSON.generate({
      animation: "shift-away",
      placement: "top",
      duration: [200, 200],
      hideOnClick: "toggle",
      zIndex: 10
    })

    expect(page).to have_css("div[data-controller='protos--popover']")
    expect(page).to have_css("div[data-protos--popover-options-value='#{options}']")
  end
end
