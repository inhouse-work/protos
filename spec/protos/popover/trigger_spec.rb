# frozen_string_literal: true

RSpec.describe Protos::Popover::Trigger do
  before do
    render described_class.new { "Some trigger" }
  end

  it "renders the popover content" do
    expect(page).to have_css("div")
    expect(page).to have_content("Some trigger")
  end

  it "connects the stimulus controller" do
    expect(page).to have_css("div[data-protos--popover-target='trigger']")
  end

  it "sets the tabindex" do
    expect(page).to have_css("div[tabindex='0']")
  end
end
