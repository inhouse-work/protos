# frozen_string_literal: true

module ComponentHelpers
  def render(component, ...)
    result = component.call(...)
    @raw_page = result
    @page = Capybara::Node::Simple.new(result)
  end

  def raw_page
    @raw_page
  end

  def page
    @page
  end
end

RSpec.configure do |config|
  config.include ComponentHelpers
end
