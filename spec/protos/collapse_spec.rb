# frozen_string_literal: true

RSpec.describe Protos::Collapse do
  subject do
    described_class.new(checkbox: true) do |collapse|
      collapse.title { "Title" }
      collapse.content { "Content" }
    end
  end

  before { render subject }

  it "renders the checkbox" do
    expect(page).to have_field type: "checkbox"
  end

  it "renders the title and content" do
    expect(page).to have_content "Content"
    expect(page).to have_content "Title"
  end

  it "renders the styles" do
    expect(page).to have_css ".collapse"
  end
end
