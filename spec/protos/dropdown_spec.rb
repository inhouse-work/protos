# frozen_string_literal: true

RSpec.describe Protos::Dropdown do
  before do
    render described_class.new
  end

  it "renders the dropdown" do
    expect(page).to have_css("div")
  end

  it "connects the stimulus controller" do
    expect(page).to have_css("div[data-controller='protos--popover']")
  end
end
