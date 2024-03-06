# frozen_string_literal: true

RSpec.describe Protos::Dropdown::Trigger do
  before do
    render described_class.new(class: "custom") { "trigger" }
  end

  it "renders the trigger" do
    expect(page).to have_css("div")
    expect(page).to have_content("trigger")
    expect(page).to have_css(".custom")
  end
end
