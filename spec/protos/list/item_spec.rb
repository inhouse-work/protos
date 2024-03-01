# frozen_string_literal: true

RSpec.describe Protos::List::Item do
  before do
    render described_class.new { "content" }
  end

  it "renders the list item" do
    expect(page).to have_css("li")
    expect(page).to have_content("content")
  end
end
