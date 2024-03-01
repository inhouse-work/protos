# frozen_string_literal: true

RSpec.describe Protos::Collapse::Title do
  before do
    render described_class.new { "Title" }
  end

  it "renders the title" do
    expect(page).to have_css(".collapse-title")
    expect(page).to have_content("Title")
  end
end
