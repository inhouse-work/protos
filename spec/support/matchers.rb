class HaveStimulusTarget
  def initialize(controller, target)
    @controller = controller
    @target = target
  end

  def matches?(page)
    @page = page
    @page.has_css?("[data-#{@controller}-target='#{@target}']")
  end

  def failure_message
    "expected page to have a stimulus target named " \
      "\"#{@target}\" on \"#{@controller}\": #{@page.native}"
  end
end

module MatcherHelpers
  def have_stimulus_target(controller, target)
    HaveStimulusTarget.new(controller, target)
  end
end

RSpec.configure do |config|
  config.include MatcherHelpers
end
