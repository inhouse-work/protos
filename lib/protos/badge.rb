module Protos
  class Badge < Component
    option :type, default: -> { :default }

    def view_template(&)
      span(**attrs, &)
    end

    private

    def theme
      {
        container: [
          "badge",
          ("badge-success" if type == :success),
          ("badge-primary" if type == :primary),
          ("badge-info" if type == :info),
          ("badge-error" if type == :error),
          ("badge-warning" if type == :warning),
          ("badge-ghost" if type == :ghost)
        ]
      }
    end
  end
end
