# frozen_string_literal: true

module Protos
  class Component < Phlex::HTML
    # DOCS: Base component for all Protos::Components. You can inherit from this
    # class to gain flexible components you can style from the outside using css
    # slots, default attrs and themes.
    #
    # This component extends Dry::Initializer and Dry::Core::ClassAttributes to
    # make configuring each class much easier. It also enables gathering up all
    # undefined options and adding them to the html_options hash.

    extend Dry::Initializer[undefined: false]
    extend Dry::Core::ClassAttributes

    # Define methods for css and attrs. Each is expected to return a hash
    defines :theme_method, type: Types::Symbol
    defines :default_attrs_method, type: Types::Symbol

    theme_method :theme
    default_attrs_method :default_attrs

    # Theme can override the css hash and add additional styles
    option :theme, as: :theme_override, default: -> { {} }, reader: false
    # Class becomes the :container key in the css hash
    option :class, as: :container_class, default: -> { "" }, reader: false
    option :html_options, default: -> { {} }, reader: false

    # Adds non-defined options to the html_options hash
    def initialize(*, **kwargs, &)
      defined_keys = self.class.dry_initializer.definitions.keys
      defined, undefined =
        kwargs
          .partition { |key, _| defined_keys.include?(key) }
          .map!(&:to_h)

      super(*, html_options: undefined, **defined, &)
    end

    private

    def attrs
      @attrs ||= build_attrs
    end

    def css
      @css ||= build_theme
    end

    def build_attrs(...)
      defaults = if respond_to?(default_attrs_method, :include_private)
        send(default_attrs_method)
      end

      Attributes
        .new(...)
        .merge(defaults)
        .merge(@html_options)
        .merge(class: css[:container])
    end

    def build_theme(...)
      component_style = if respond_to?(theme_method, :include_private)
        send(theme_method)
      end

      Theme
        .new(...)
        .merge(component_style)
        .merge(@theme_override)
        .merge(container: @container_class)
    end

    def theme_method
      self.class.theme_method
    end

    def default_attrs_method
      self.class.default_attrs_method
    end
  end
end
