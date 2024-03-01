# frozen_string_literal: true

RSpec.describe Protos::Command::Trigger do
  before do
    render described_class.new { "Trigger" }
  end

  it "renders the trigger" do
    expect(page).to have_button
    expect(page).to have_content("Trigger")
  end

  it "adds the stimulus action" do
    expect(page).to have_css("[data-action='protos--modal#open']")
  end
end
