# frozen_string_literal: true

RSpec.describe Protos::Steps::Step do
  subject do
    described_class.new(type: :info) { "Step 1" }
  end

  before { render subject }

  it "renders the step" do
    expect(page).to have_css("li")
    expect(page).to have_content("Step 1")
  end

  it "renders the styles" do
    expect(page).to have_css(".step")
  end
end
