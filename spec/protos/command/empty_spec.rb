# frozen_string_literal: true

RSpec.describe Protos::Command::Empty do
  before do
    render described_class.new
  end

  it "renders the empty" do
    expect(page).to have_css("li")
  end

  it "renders as hidden" do
    expect(page).to have_css(".hidden")
  end

  it "adds the stimulus target" do
    expect(page).to have_css("[data-protos--command-target='empty']")
  end
end
