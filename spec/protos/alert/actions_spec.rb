# frozen_string_literal: true

RSpec.describe Protos::Alert::Actions do
  before do
    render described_class.new { "Action" }
  end

  it "renders the action" do
    expect(page).to have_css("nav")
    expect(page).to have_content("Action")
  end
end
