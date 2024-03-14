# frozen_string_literal: true

RSpec.describe Protos::Collapse::Title do
  context "with an id" do
    before do
      render described_class.new(id: 1) { "Title" }
    end

    it "renders the title as a label" do
      expect(page).to have_css(".collapse-title")
      expect(page).to have_content("Title")
      expect(page).to have_css("label[for='1']")
    end
  end

  context "without an id" do
    before do
      render described_class.new { "Title" }
    end

    it "renders the title as a div" do
      expect(page).to have_css(".collapse-title")
      expect(page).to have_content("Title")
      expect(page).to have_css("div")
    end
  end
end
