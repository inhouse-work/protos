# frozen_string_literal: true

module Protos
  class Component < Phlex::HTML
    # DOCS: Base component

    extend Dry::Initializer

    option :theme, default: -> { {} }, reader: :private
    option :class, as: :container_class, default: -> { "" }, reader: :private
    option :data, default: -> { {} }, reader: :private
    option :html_options, default: -> { {} }, reader: :private

    def initialize(*args, **kwargs, &block)
      raise_block_in_initializer_error if block

      defined_keys = self.class.dry_initializer.definitions.keys
      defined, undefined =
        kwargs
          .partition { |key, _| defined_keys.include?(key) }
          .map(&:to_h)

      super(*args, html_options: undefined, **defined)
    end

    private

    def raise_block_in_initializer_error
      raise(
        ArgumentError,
        "It is unexpected to pass a block to the initializer of a component. " \
        "You might have tried to render and passed a block but it went to " \
        "the component.new. Check your render call."
      )
    end

    def attrs
      @attrs ||= build_attrs
    end

    def css
      @css ||= build_theme
    end

    def style
      {}
    end

    def build_attrs(...)
      Attributes
        .new(...)
        .merge(html_options)
        .merge(data:)
        .merge(class: css[:container])
    end

    def build_theme(...)
      Theme
        .new(...)
        .merge(style)
        .merge(theme)
        .merge(container: container_class)
    end
  end
end
