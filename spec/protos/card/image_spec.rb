# frozen_string_literal: true

RSpec.describe Protos::Card::Image do
  before do
    render described_class.new { "image" }
  end

  it "renders the actions" do
    expect(page).to have_css("figure")
    expect(page).to have_content("image")
  end
end
