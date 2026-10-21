# frozen_string_literal: true

module Protos
  # A class that represents the attributes of a component. This would be
  # all html options except for `class` and `theme`.
  class Attributes
    def initialize(attrs = {}, **kwargs)
      @attrs = attrs.merge!(kwargs)
    end

    # Accesses the value for a given attribute key.
    # @param key [Symbol, String] The attribute key to access.
    # @return [Object, nil] The value associated with the key, or nil if
    #   not found.
    def [](key)
      @attrs[key]
    end

    # Merges the provided hashes into the existing attributes.
    # @param hashes [Array<Hash>] The hashes of attributes to merge.
    # @return [Attributes] Merges the provided hashes into the existing
    def merge(*hashes)
      @attrs = mix(@attrs, *hashes)
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
