module Protos
  class Swap < Component
    def template
      label(**attrs) do
        input(type: :checkbox)
        yield if block_given?
      end
    end

    def on(...)
      On.new(...)
    end

    def off(...)
      Off.new(...)
    end

    private

    def theme
      {
        container: tokens("swap")
      }
    end
  end
end
