# frozen_string_literal: true

module Protos
  class Steps < Component
    # DOCS: Steps can be used to show a list of steps in a process.
    # https://daisyui.com/components/steps/

    autoload :Step, "protos/steps/step"

    option :vertical, type: Types::Bool, default: -> { false }

    def view_template(&)
      ol(**attrs, &)
    end

    def step(...) = render Step.new(...)

    private

    def theme
      {
        container: [
          "steps",
          ("steps-vertical" if vertical)
        ]
      }
    end
  end
end
