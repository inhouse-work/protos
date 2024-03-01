# frozen_string_literal: true

RSpec.describe Protos::Modal::Dialog do
  before do
    render described_class.new { "Content" }
  end

  it "renders the content" do
    expect(page).to have_content("Content")
  end

  it "adds the utility classes" do
    expect(page).to have_css(".modal")
    expect(page).to have_css(".modal-box")
  end

  it "adds the stimulus target" do
    expect(page).to have_css("[data-protos--modal-target='modal']")
  end
end
