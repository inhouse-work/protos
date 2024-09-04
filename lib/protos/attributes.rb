# frozen_string_literal: true

module Protos
  class Attributes
    # DOCS: A class that represents the attributes of a component. This would be
    # all html options except for `class` and `theme`.

    def initialize(attrs = {}, **kwargs)
      @attrs = attrs.merge!(kwargs)
    end

    def [](key)
      @attrs[key]
    end

    def merge(hash)
      return self unless hash

      @attrs = mix(@attrs, hash)
      self
    end

    # Allows for the use of the `**` operator to pass the attributes to
    # a method.
    def to_hash
      @attrs
    end

    private

    def mix(hash, *hashes)
      Mix.call(hash, *hashes)
    end
  end
end
