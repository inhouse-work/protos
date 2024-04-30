# frozen_string_literal: true

RSpec.describe Protos::Steps do
  subject do
    described_class.new(vertical: true) do |steps|
      steps.step { "Step 1" }
    end
  end

  before { render subject }

  it "renders the steps" do
    expect(page).to have_css("ol")
    expect(page).to have_content("Step 1")
  end

  it "renders the styles" do
    expect(page).to have_css(".steps")
    expect(page).to have_css(".steps-vertical")
  end
end
