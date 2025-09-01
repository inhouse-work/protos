# frozen_string_literal: true

module Protos
  # The core typography module that can be mixedin to override the
  # default elements with custom elements.
  module Typography
    autoload :Heading, "protos/typography/heading"
    autoload :Paragraph, "protos/typography/paragraph"
    autoload :InlineLink, "protos/typography/inline_link"

    def h1(**, &)
      render Heading.new(level: 1, size: :xl, **, &)
    end

    def h2(**, &)
      render Heading.new(level: 2, size: :lg, **, &)
    end

    def h3(**, &)
      render Heading.new(level: 3, size: :md, **, &)
    end

    def h4(**, &)
      render Heading.new(level: 4, size: :sm, **, &)
    end

    def p(**, &)
      render Paragraph.new(**, &)
    end

    def inline_a(**, &)
      render InlineLink.new(**, &)
    end
  end
end
