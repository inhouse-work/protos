# frozen_string_literal: true

TypographyTestComponent = Class.new(Protos::Component) do
  include Protos::Typography

  def view_template(&block)
    h1(**attrs, &block)
  end
end

RSpec.describe Protos::Typography do
  before do
    render TypographyTestComponent.new(class: "text-red-500", size: :xl) { "Hello" }
  end

  it "renders the component" do
    expect(page).to have_css("h1")
    expect(page).to have_content("Hello")
  end

  it "applies the styles" do
    expect(page).to have_css(".text-red-500")
    expect(page).to have_css(".text-4xl")
  end
end
