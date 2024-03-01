# frozen_string_literal: true

RSpec.describe Protos::Command::Input do
  before do
    render described_class.new { "X" }
  end

  it "renders the input" do
    expect(page).to have_field
  end

  it "renders the icon" do
    expect(page).to have_content("X")
  end

  it "adds the stimulus action" do
    expect(page).to have_css("[data-action='protos--command#filter']")
  end
end
