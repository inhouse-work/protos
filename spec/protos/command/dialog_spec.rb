# frozen_string_literal: true

RSpec.describe Protos::Command::Dialog do
  before do
    render described_class.new
  end

  it "renders the dialog" do
    expect(page).to have_css("dialog")
  end

  it "adds the close button" do
    expect(page).to have_css("form[method='dialog'] button")
  end

  it "adds the stimulus target" do
    expect(page).to have_css("[data-protos--modal-target='modal']")
  end
end
