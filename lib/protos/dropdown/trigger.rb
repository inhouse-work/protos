# frozen_string_literal: true

module Protos
  class Dropdown
    # The trigger for a dropdown. This inherits from the trigger of
    # a popover as the main functionality comes from there.
    class Trigger < Popover::Trigger
    end
  end
end
