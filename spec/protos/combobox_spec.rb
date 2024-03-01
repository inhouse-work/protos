# frozen_string_literal: true

RSpec.describe Protos::Combobox do
  before do
    render described_class.new { "Hello" }
  end

  it "renders the component" do
    expect(page).to have_css("details")
  end

  it "adds the stimulus controller" do
    expect(page).to have_css("[data-controller='protos--command']")
  end
end
