# frozen_string_literal: true

module Protos
  # A steps component
  #
  # @see https://daisyui.com/components/steps/
  #
  # @example
  #   render Protos::Steps.new(vertical: true) do |steps|
  #     steps.step(type: :primary) { "Step 1" }
  #     steps.step(type: :primary) { "Step 2" }
  #     steps.step { "Step 3" }
  #   end
  class Steps < Component
    autoload :Step, "protos/steps/step"

    # @!attribute [r] vertical
    # @return [Boolean] Whether to display steps vertically instead of
    #   horizontally.
    option :vertical, type: Types::Bool, default: -> { false }

    # Renders the full steps element.
    #
    # @yield The content block to define individual steps.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      ol(**attrs, &)
    end

    # Renders a step.
    #
    # @param (see Protos::Steps::Step#initialize)
    # @return [nil]
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
