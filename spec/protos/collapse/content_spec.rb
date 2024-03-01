# frozen_string_literal: true

RSpec.describe Protos::Collapse::Content do
  before do
    render described_class.new { "Content" }
  end

  it "renders the title" do
    expect(page).to have_css(".collapse-content")
    expect(page).to have_content("Content")
  end
end
