# frozen_string_literal: true

TestComponent = Class.new(Protos::Component) do
  def template(&block)
    div(**attrs) do
      div(class: css[:inner], &block)
    end
  end

  private

  def style
    {
      container: tokens("test-component"),
      inner: tokens("test-component-inner")
    }
  end
end

RSpec.describe Protos::Component do
  before do
    render TestComponent.new(class: "injected-class", role: "test") { "Hello" }
  end

  it "renders the component" do
    expect(page).to have_css("div > div")
    expect(page).to have_content("Hello")
  end

  it "applies the styles" do
    expect(page).to have_css(".test-component")
    expect(page).to have_css(".injected-class")
    expect(page).to have_css(".test-component-inner")
  end

  it "applies the undefined html options" do
    expect(page).to have_css("[role='test']")
  end
end
