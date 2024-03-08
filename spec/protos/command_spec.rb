# frozen_string_literal: true

RSpec.describe Protos::Command do
  before do
    render described_class.new { "Test" }
  end

  it "renders the container" do
    expect(page).to have_content "Test"
  end

  it "connects the stimulus controller for the modal" do
    expect(page).to have_css("[data-controller='protos--modal']")
  end
end
