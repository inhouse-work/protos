# frozen_string_literal: true

RSpec.describe Protos::Toast do
  before do
    render described_class.new { "Toast content" }
  end

  it "renders a toast" do
    expect(page).to have_css("dialog[open]")
    expect(page).to have_content("Toast content")
  end
end
