# frozen_string_literal: true

module Protos
  # This class is responsible for safely merging in both user supplied
  # and default attributes. When a user adds { data: { controller: "foo" }} to
  # their component. This will merge the value in so that any default
  # controllers do not get overridden.
  module Mix
    module_function

    MERGEABLE_ATTRIBUTES = Set.new(%i[class data]).freeze

    def call(old_hash, *hashes)
      hashes
        .compact
        .each_with_object(old_hash) do |new_hash, result|
          merge(result, new_hash, top_level: true)
        end
    end

    def merge(old_hash, new_hash, top_level: false) # rubocop:disable Metrics/PerceivedComplexity
      old_hash.merge!(new_hash) do |key, old, new|
        next old unless new
        next old if old == new
        next new if top_level && !MERGEABLE_ATTRIBUTES.include?(key)

        case [old, new]
        in String, String then "#{old} #{new}"
        in Array, Array then old + new
        in Hash, Hash then merge(old, new)
        else new
        end
      end
    end
  end
end
