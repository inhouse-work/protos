# frozen_string_literal: true

module Protos
  module Typography
    # DOCS: The core typography module that can be mixedin to override the
    # default elements with custom elements.

    def h1(**, &block)
      render Heading.new(level: 1, size: :xl, **, &block)
    end

    def h2(**, &block)
      render Heading.new(level: 2, size: :lg, **, &block)
    end

    def h3(**, &block)
      render Heading.new(level: 3, size: :md, **, &block)
    end

    def h4(**, &block)
      render Heading.new(level: 4, size: :sm, **, &block)
    end

    def p(**, &block)
      render Paragraph.new(**, &block)
    end

    def inline_a(**, &block)
      render InlineLink.new(**, &block)
    end
  end
end
