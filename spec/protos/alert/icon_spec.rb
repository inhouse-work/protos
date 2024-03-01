# frozen_string_literal: true

RSpec.describe Protos::Alert::Icon do
  before do
    render described_class.new { "icon" }
  end

  it "renders the action" do
    expect(page).to have_css("div")
    expect(page).to have_content("icon")
  end
end
