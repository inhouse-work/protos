# frozen_string_literal: true

module Protos
  module Types
    include Dry.Types()

    Colors = Types::Coercible::Symbol.enum(
      :default,
      :primary,
      :secondary,
      :accent,
      :info,
      :success,
      :warning,
      :error
    )

    Sizes = Types::Coercible::Symbol.enum(:default, :xs, :sm, :md, :lg, :xl)
  end
end
