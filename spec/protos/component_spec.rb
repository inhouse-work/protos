# frozen_string_literal: true

TestComponent = Class.new(Protos::Component) do
  css_method :custom_style
  attrs_method :custom_options

  def template(&block)
    div(**attrs) do
      div(class: "#{css[:inner]} #{css[:overridable]}") do
        span(class: css[:non_existent]) { "Hello" }
        div(class: css[:deeply][:nested], &block)
      end
    end
  end

  private

  def custom_options
    {
      data: { "test-component": "true" }
    }
  end

  def custom_style
    {
      container: tokens("test-component", "removed-component"),
      inner: tokens("test-component-inner"),
      overridable: tokens("removed-component"),
      deeply: {
        nested: tokens("test-component-deeply-nested")
      }
    }
  end
end

RSpec.describe Protos::Component do
  before do
    render TestComponent.new(
      class: "injected-class",
      role: "test",
      data: { value: "test" },
      theme: {
        "!container": "removed-component",
        overridable!: "added-component"
      }
    ) { "Hello" }
  end

  it "renders the component" do
    expect(page).to have_css("div > div > div")
    expect(page).to have_css("div > div > span")
    expect(page).to have_content("Hello")
  end

  it "overrides the theme" do
    expect(page).to have_css(".added-component")
  end

  it "removes classes from the theme" do
    expect(page).to have_no_css(".removed-component")
  end

  it "applies the styles" do
    expect(page).to have_css(".test-component")
    expect(page).to have_css(".injected-class")
    expect(page).to have_css(".test-component-inner")
    expect(page).to have_css(".test-component-deeply-nested")
  end

  it "applies the html options" do
    expect(page).to have_css("[role='test']")
    expect(page).to have_css("[data-test-component='true']")
    expect(page).to have_css("[data-value='test']")
  end
end
