# frozen_string_literal: true

RSpec.describe Protos::Card::Actions do
  before do
    render described_class.new { "Actions" }
  end

  it "renders the actions" do
    expect(page).to have_css(".card-actions")
    expect(page).to have_content("Actions")
  end
end
