# frozen_string_literal: true

TestComponent = Class.new(Protos::Component) do
  theme_method :custom_style
  default_attrs_method :custom_options

  def view_template(&)
    div(**attrs) do
      div(class: "#{css[:inner]} #{css[:overridable]}") do
        span(class: css[:non_existent]) { "Hello" }
      end
    end
  end

  private

  def custom_options
    {
      data: {
        "test-component": "true",
        controller: "controller-one"
      }
    }
  end

  def custom_style
    {
      container: tokens("test-component", "removed-component"),
      inner: "test-component-inner",
      overridable: ["removed-component"]
    }
  end
end

RSpec.describe Protos::Component do
  before do
    render TestComponent.new(
      class: "injected-class",
      role: "test",
      data: {
        value: "test",
        controller: "controller-two"
      },
      theme: {
        "!container": "removed-component",
        overridable!: "added-component"
      }
    ) { "Hello" }
  end

  it "renders the component" do
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
  end

  it "applies the html options" do
    expect(page).to have_css("[role='test']")
    expect(page).to have_css("[data-test-component='true']")
    expect(page).to have_css("[data-value='test']")
    expect(page).to have_css("[data-controller='controller-one controller-two']")
  end
end
