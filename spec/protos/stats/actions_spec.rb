# frozen_string_literal: true

RSpec.describe Protos::Stats::Actions do
  before do
    render described_class.new { "Action content" }
  end

  it "renders the component" do
    expect(page).to have_css("div")
    expect(page).to have_content("Action content")
  end

  it "renders the style" do
    expect(page).to have_css(".stat-actions")
  end
end
