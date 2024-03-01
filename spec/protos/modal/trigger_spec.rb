# frozen_string_literal: true

RSpec.describe Protos::Modal::Trigger do
  before do
    render described_class.new { "Open" }
  end

  it "renders the button" do
    expect(page).to have_button
    expect(page).to have_content("Open")
  end

  it "adds the stimulus action" do
    expect(page).to have_css("[data-action='protos--modal#open']")
  end
end
