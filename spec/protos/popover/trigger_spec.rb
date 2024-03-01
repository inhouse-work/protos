# frozen_string_literal: true

RSpec.describe Protos::Popover::Trigger do
  before do
    render described_class.new { "Some trigger" }
  end

  it "renders the popover content" do
    expect(page).to have_css("summary")
    expect(page).to have_content("Some trigger")
  end
end
