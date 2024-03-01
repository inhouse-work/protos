# frozen_string_literal: true

module Protos
  class Component < Phlex::HTML
    # DOCS: Base component

    extend Dry::Initializer
    extend Dry::Core::ClassAttributes

    # Define a method to access the css hash. This is expected to be
    # a hash of styles that will be merged to the main theme
    defines :css_method, type: Types::Symbol
    defines :attrs_method, type: Types::Symbol

    css_method :theme
    attrs_method :default_attrs

    # Theme can override the css hash and add additional styles
    option :theme, as: :theme_override, default: -> { {} }, reader: :private
    # Class becomes the :container key in the css hash
    option :class, as: :container_class, default: -> { "" }, reader: :private
    option :data, default: -> { {} }, reader: :private
    option :html_options, default: -> { {} }, reader: :private

    # Adds non-defined options to the html_options hash
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

    def build_attrs(...)
      defaults = if respond_to?(self.class.attrs_method, :include_private)
        send(self.class.attrs_method)
      end

      Attributes
        .new(...)
        .merge(defaults)
        .merge(html_options)
        .merge(class: css[:container])
    end

    def build_theme(...)
      component_style = if respond_to?(self.class.css_method, :include_private)
        send(self.class.css_method)
      end

      Theme
        .new(...)
        .merge(component_style)
        .merge(theme_override)
        .merge(container: container_class)
    end
  end
end
