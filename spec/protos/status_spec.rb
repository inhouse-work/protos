# frozen_string_literal: true

RSpec.describe Protos::Status do
  subject do
    described_class.new(size: :lg, type: :primary) { "Good" }
  end

  before { render subject }

  it "renders the status" do
    expect(page).to have_css("div")
    expect(page).to have_content("Good")
  end

  it "renders the styles" do
    expect(page).to have_css(".status")
    expect(page).to have_css(".status-primary")
  end
end
