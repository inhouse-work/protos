# frozen_string_literal: true

RSpec.describe Protos::Command do
  before do
    render described_class.new { "Test" }
  end

  it "renders the container" do
    expect(page).to have_content "Test"
  end
end
