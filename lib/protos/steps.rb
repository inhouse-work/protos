# frozen_string_literal: true

module Protos
  class Steps < Component
    # DOCS: Steps can be used to show a list of steps in a process.
    # https://daisyui.com/components/steps/

    option :vertical, type: Types::Bool, default: -> { false }

    def view_template(&)
      ol(**attrs, &)
    end

    def step(...) = render Step.new(...)

    private

    def theme
      {
        container: tokens(
          "steps",
          vertical: "steps-vertical"
        )
      }
    end
  end
end
