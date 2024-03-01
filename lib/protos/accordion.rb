# frozen_string_literal: true

module Protos
  class Accordion < Component
    option :id, default: -> { SecureRandom.uuid }

    def template(&block)
      ul(**attrs, &block)
    end

    def item(**kwargs)
      Item.new(id:, **kwargs)
    end

    def title(...)
      Collapse::Title.new(...)
    end

    def content(...)
      Collapse::Content.new(...)
    end

    private

    def style
      {
        container: tokens(
          "join",
          "join-vertical"
        )
      }
    end
  end
end
