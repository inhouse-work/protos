# frozen_string_literal: true

module Protos
  module Typography
    def h1(**options, &block)
      render(Heading.new(level: 1, size: :xl, **options), &block)
    end

    def h2(**options, &block)
      render(Heading.new(level: 2, size: :lg, **options), &block)
    end

    def h3(**options, &block)
      render(Heading.new(level: 3, size: :md, **options), &block)
    end

    def h4(**options, &block)
      render(Heading.new(level: 4, size: :sm, **options), &block)
    end

    def p(**options, &block)
      render(Paragraph.new(**options), &block)
    end

    def inline_a(**options, &block)
      render(InlineLink.new(**options), &block)
    end
  end
end
