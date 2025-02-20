# frozen_string_literal: true

module ComponentHelpers
  def render(component, ...)
    result = component.call(...)
    @page = Capybara::Node::Simple.new(result)
  end

  def page
    @page
  end
end

RSpec.configure do |config|
  config.include ComponentHelpers
end
