# frozen_string_literal: true

TestComponent = Class.new(Protos::Component) do
  def template(&block)
    summary(**attrs, &block)
  end

  private

  def css
    @css ||= build_theme(
      container: tokens("test-component")
    )
  end
end

RSpec.describe Protos::Component do
  before do
    render TestComponent.new(class: "injected-class", role: "test") { "Hello" }
  end

  it "renders the component" do
    expect(page).to have_css("summary")
    expect(page).to have_content("Hello")
  end

  it "applies the styles" do
    expect(page).to have_css(".test-component")
    expect(page).to have_css(".injected-class")
  end

  it "applies the undefined html options" do
    expect(page).to have_css("[role='test']")
  end
end
