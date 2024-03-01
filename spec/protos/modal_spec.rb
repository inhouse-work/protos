# frozen_string_literal: true

RSpec.describe Protos::Modal do
  before do
    render described_class.new
  end

  it "attaches the stimulus controller" do
    expect(page).to have_css("[data-controller='protos--modal']")
  end
end
