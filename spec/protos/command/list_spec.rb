# frozen_string_literal: true

RSpec.describe Protos::Command::List do
  before do
    render described_class.new
  end

  it "renders the list" do
    expect(page).to have_css("ul")
  end

  it "adds the styles" do
    expect(page).to have_css(".menu")
  end

  it "connects the stimulus controller for command" do
    expect(page).to have_css("[data-controller='protos--command']")
  end
end
