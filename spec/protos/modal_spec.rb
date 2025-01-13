# frozen_string_literal: true

RSpec.describe Protos::Modal do
  subject do
    described_class.new do |modal|
      modal.trigger { "Trigger" }
      modal.dialog do
        modal.plain "Content"
        modal.close_button { "Close" }
      end
    end
  end

  before do
    render subject
  end

  it "renders the modal" do
    expect(page).to have_css("div")
    expect(page).to have_content("Trigger")
    expect(page).to have_content("Content")
    expect(page).to have_content("Close")
  end

  it "attaches the stimulus controller" do
    expect(page).to have_css("[data-controller='protos--modal']")
    expect(page).to have_css("[data-action='click->protos--modal#backdropClose']")
  end
end
