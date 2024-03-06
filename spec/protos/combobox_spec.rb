# frozen_string_literal: true

RSpec.describe Protos::Combobox do
  before do
    render described_class.new { "Hello" }
  end

  it "renders the component" do
    expect(page).to have_css("div")
  end

  it "adds the stimulus controllers" do
    expect(page).to have_css("[data-controller='protos--command']")
    expect(page).to have_css("[data-controller='protos--popover']")
  end
end
